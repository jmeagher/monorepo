package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/jmeagher/monorepo/tracing/jaeger"
	opentracing "github.com/opentracing/opentracing-go"

	"github.com/opentracing/opentracing-go/ext"
)

func main() {
	port := flag.Int("port", 8080, "port to listen on")
	host := flag.String("host", "localhost", "host to connect to")
	requestCount := flag.Int("requests", 10, "number of test requests to make")
	flag.Parse()

	url := fmt.Sprintf("http://%s:%d", *host, *port)
	log.Printf("Using server URL: %v\n", url)

	var closer, err = jaeger.Init()
	if err != nil {
		log.Fatal("Jaeger Init Fail: ", err)
		return
	}
	defer closer.Close()
	time.Sleep(100 * time.Millisecond)

	for i := 0; i < *requestCount; i++ {
		doTest(i, url)
	}
}

func doTest(testRun int, url string) {
	sp := opentracing.StartSpan("test_request")
	defer sp.Finish()
	ext.SamplingPriority.Set(sp, 1)
	sp.SetTag("request_num", testRun)
	ctx := opentracing.ContextWithSpan(context.Background(), sp)
	doRequest(ctx, url)
}

func doRequest(context context.Context, url string) {
	if span := opentracing.SpanFromContext(context); span != nil {

		httpClient := &http.Client{}
		httpReq, _ := http.NewRequest("GET", url, nil)

		// Transmit the span's TraceContext as HTTP headers on our
		// outbound request.
		opentracing.GlobalTracer().Inject(
			span.Context(),
			opentracing.HTTPHeaders,
			opentracing.HTTPHeadersCarrier(httpReq.Header))

		sp := opentracing.StartSpan(
			"client_call",
			opentracing.ChildOf(span.Context()))
		defer sp.Finish()
		resp, err := httpClient.Do(httpReq)

		if err != nil {
			log.Printf("Client error: %s", err.Error())
			time.Sleep(10 * time.Millisecond)
			return
		}

		if resp != nil {
			sp.SetTag("http.status", resp.StatusCode)
			log.Printf("response code: %d\n", resp.StatusCode)
		}
	}
}
