package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/jmeagher/monorepo/tracing/handlers"
	"github.com/jmeagher/monorepo/tracing/jaeger"
)

func jsonResponder(text string, code int, delay *time.Duration) http.Handler {
	json := fmt.Sprintf("{\"text\": \"%s\", \"success\": %t}", text, code < 300)
	return handlers.DelayHandler(*delay, handlers.StaticHandler(json, "application/json", code))
}

func main() {

	flakePct := flag.Float64("flakepct", 0.0, "percentage of responses to fail")
	listenPort := flag.Int("port", 8080, "port to listen on")
	okDelay := flag.Duration("okdelay", 0*time.Millisecond, "delay to add in for 'ok' responses")
	errDelay := flag.Duration("errdelay", 0*time.Millisecond, "delay to add in for 'error' responses")
	flag.Parse()

	var closer, err = jaeger.Init()
	if err != nil {
		log.Fatal("Jaeger Init Fail: ", err)
		return
	}
	defer closer.Close()

	if *flakePct > 0.0 {
		http.Handle("/", handlers.GlobalOpenTracingHandler("maybe-flake", handlers.RandomSplitHandler(
			float32(*flakePct),
			handlers.GlobalOpenTracingHandler("ok-handler", jsonResponder("flake-ok", 200, okDelay)),
			handlers.GlobalOpenTracingHandler("flake-handler", jsonResponder("flake-bad", 400, errDelay)))))
	} else {
		http.Handle("/", handlers.GlobalOpenTracingHandler("always-ok", jsonResponder("ok", 200, okDelay)))
	}
	log.Printf("Listening on port %d and will be %.1f percent flaky\n", *listenPort, 100*(*flakePct))
	log.Printf("  okResponseDelay=%v  errorResponseDelay=%v", *okDelay, *errDelay)
	err = http.ListenAndServe(fmt.Sprintf(":%d", *listenPort), nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
