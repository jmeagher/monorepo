package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/jmeagher/monorepo/golang/httphelpers"
	"github.com/jmeagher/monorepo/tracing/handlers"
	"github.com/jmeagher/monorepo/tracing/jaeger"
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	SuccessRate  float64       `default:"0.8"`
	Debug        bool          `default:"false"`
	ErrorCode    int           `default:"400"`
	ListenPort   int           `default:"8080"`
	ErrorDelay   time.Duration `default:"0"`
	SuccessDelay time.Duration `default:"0"`
}

func jsonResponder(text string, code int, delay *time.Duration) http.Handler {
	json := fmt.Sprintf("{\"text\": \"%s\", \"success\": %t}", text, code < 300)
	return httphelpers.DelayHandler(*delay, httphelpers.StaticHandler(json, "application/json", code))
}

func main() {
	var cfg Config

	var err = envconfig.Process("", &cfg)
	if err != nil {
		log.Fatal("Config parsing failure: ", err)
		return
	}

	successPct := flag.Float64("success_rate", cfg.SuccessRate, "percentage of responses to succeed")
	listenPort := flag.Int("port", cfg.ListenPort, "port to listen on")
	okDelay := flag.Duration("successdelay", cfg.SuccessDelay, "delay to add in for successful responses")
	errDelay := flag.Duration("errdelay", cfg.ErrorDelay, "delay to add in for 'error' responses")
	errorCode := flag.Int("error_code", cfg.ErrorCode, "Http status code returned for 'error' responses")
	debug := flag.Bool("debug", cfg.Debug, "If enabled extra debug request information will be printed")
	flag.Parse()

	var closer, e = jaeger.Init()
	if e != nil {
		log.Fatal("Jaeger Init Fail: ", e)
		return
	}
	defer closer.Close()

	var handler http.Handler
	if *successPct < 1.0 {
		tmp := handlers.GlobalOpenTracingHandler("maybe-flake", httphelpers.RandomSplitHandler(
			float32(*successPct),
			handlers.GlobalOpenTracingHandler("ok-handler", jsonResponder("flake-ok", 200, okDelay)),
			handlers.GlobalOpenTracingHandler("flake-handler", jsonResponder("flake-bad", *errorCode, errDelay))))
		tmp.AddHandlerTag("static-tag", "just a test of flaky server")
		handler = tmp
	} else {
		tmp := handlers.GlobalOpenTracingHandler("always-ok", jsonResponder("ok", 200, okDelay))
		tmp.AddHandlerTag("static-tag", "just a test always ok")
		handler = tmp
	}
	if *debug {
		handler = httphelpers.DebugRequestHandler(handler)
	}
	http.Handle("/", handler)

	log.Printf("Listening on port %d and will be %.1f percent flaky\n", *listenPort, 100*(*successPct))
	log.Printf("  okResponseDelay=%v  errorResponseDelay=%v  debug=%v", *okDelay, *errDelay, *debug)
	err = http.ListenAndServe(fmt.Sprintf(":%d", *listenPort), nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
