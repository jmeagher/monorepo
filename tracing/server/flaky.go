package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/jmeagher/monorepo/tracing/handlers"
	"github.com/jmeagher/monorepo/tracing/jaeger"
)

func jsonResponder(text string, code int) http.Handler {
	return handlers.StaticHandler(fmt.Sprintf("{\"text\": \"%s\", \"success\": %t}", text, code < 300), "application/json", code)
}

func main() {

	flakePct := flag.Float64("flakepct", 0.0, "percentage of responses to fail")
	listenPort := flag.Int("port", 8080, "port to listen on")
	flag.Parse()

	jaeger.JaegerInit("tracing_server")

	if *flakePct > 0.0 {
		http.Handle("/", handlers.RandomSplitHandler(
			float32(*flakePct),
			jsonResponder("flake-ok", 200),
			jsonResponder("flake-bad", 400)))
	} else {
		http.Handle("/", jsonResponder("ok", 200))
	}
	fmt.Printf("Listening on port %d and will be %.1f percent flaky\n", *listenPort, 100*(*flakePct))
	err := http.ListenAndServe(fmt.Sprintf(":%d", *listenPort), nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
