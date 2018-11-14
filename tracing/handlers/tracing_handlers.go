package handlers

import (
	"fmt"
	"log"
	"net/http"

	"github.com/opentracing/opentracing-go"
	"github.com/opentracing/opentracing-go/ext"
)

// GlobalOpenTracingHandler wraps an existing handler with open-tracing calls using the global tracer
func GlobalOpenTracingHandler(spanName string, wrapped http.Handler) http.Handler {
	return OpenTracingHandler(opentracing.GlobalTracer(), spanName, wrapped)
}

// OpenTracingHandler wraps an existing handler with open-tracing calls using the tracer
func OpenTracingHandler(tracer opentracing.Tracer, spanName string, wrapped http.Handler) http.Handler {
	return &openTracingHandler{tracer, fmt.Sprintf("http.server.%s", spanName), wrapped}
}

type openTracingHandler struct {
	tracer   opentracing.Tracer
	spanName string
	wrapped  http.Handler
}

func (f *openTracingHandler) ServeHTTP(writer http.ResponseWriter, req *http.Request) {
	var request = req
	wireContext, err := opentracing.GlobalTracer().Extract(
		opentracing.HTTPHeaders,
		opentracing.HTTPHeadersCarrier(request.Header))
	if err != nil {
		log.Println("Global Tracer Extract Error: ", err)
	}

	var serverSpan opentracing.Span

	if wireContext != nil {
		serverSpan = opentracing.StartSpan(
			f.spanName,
			ext.RPCServerOption(wireContext))
		defer serverSpan.Finish()
		ctx := opentracing.ContextWithSpan(request.Context(), serverSpan)
		request = request.WithContext(ctx)

		opentracing.GlobalTracer().Inject(
			serverSpan.Context(),
			opentracing.HTTPHeaders,
			opentracing.HTTPHeadersCarrier(request.Header))

	} else {
		log.Println("No wire context specified?")
	}

	f.wrapped.ServeHTTP(writer, request)
}
