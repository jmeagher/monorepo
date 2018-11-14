package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/jmeagher/monorepo/tracing/jaeger"
	opentracing "github.com/opentracing/opentracing-go"

	"github.com/opentracing/opentracing-go/ext"
)

func main() {
	var closer, err = jaeger.Init()
	if err != nil {
		log.Fatal("Jaeger Init Fail: ", err)
		return
	}
	defer closer.Close()
	time.Sleep(100 * time.Millisecond)

	for i := 0; i < 30; i++ {
		doTest(i)
	}
}

func doTest(testRun int) {
	sp := opentracing.StartSpan(fmt.Sprintf("test_request_%d", testRun))
	defer sp.Finish()
	ext.SamplingPriority.Set(sp, 1)
	ctx := opentracing.ContextWithSpan(context.Background(), sp)
	doRequest(ctx)
}

func doRequest(context context.Context) {
	if span := opentracing.SpanFromContext(context); span != nil {

		httpClient := &http.Client{}
		httpReq, _ := http.NewRequest("GET", "http://localhost:18088/", nil)

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
			log.Printf("response code: %d\n", resp.StatusCode)
		}
	}
}
