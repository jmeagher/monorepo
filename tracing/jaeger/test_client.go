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
		sp := opentracing.StartSpan(fmt.Sprintf("test_request_%d", i))
		ext.SamplingPriority.Set(sp, 1)
		ctx := opentracing.ContextWithSpan(context.Background(), sp)
		doRequest(ctx)
		sp.Finish()
	}
}

func doRequest(context context.Context) {
	if span := opentracing.SpanFromContext(context); span != nil {

		httpClient := &http.Client{}
		httpReq, _ := http.NewRequest("GET", "http://localhost:18088/", nil)

		// Transmit the span's TraceContext as HTTP headers on our
		// outbound request.
		fmt.Printf("Global tracer: %T\n", opentracing.GlobalTracer())
		fmt.Printf("Client header1: %v\n", httpReq.Header)
		opentracing.GlobalTracer().Inject(
			span.Context(),
			opentracing.HTTPHeaders,
			opentracing.HTTPHeadersCarrier(httpReq.Header))
		fmt.Printf("Client header2: %v\n", httpReq.Header)

		sp := opentracing.StartSpan(
			"client_call",
			opentracing.ChildOf(span.Context()))
		resp, err := httpClient.Do(httpReq)
		sp.Finish()
		span.Finish()

		if err != nil {
			log.Printf("Client error: %s", err.Error())
			return
		}

		if resp != nil {
			log.Printf("response code: %d\n", resp.StatusCode)
		}
	}
}
