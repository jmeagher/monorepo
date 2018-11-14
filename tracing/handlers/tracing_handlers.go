package handlers

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"

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
	fmt.Printf("Server header: %v\n", request.Header)
	wireContext, err := opentracing.GlobalTracer().Extract(
		opentracing.HTTPHeaders,
		opentracing.HTTPHeadersCarrier(request.Header))
	if err != nil {
		log.Println("Global Tracer Extract Error: ", err)
		dump, _ := httputil.DumpRequest(req, true)
		log.Printf("Server request dump: %q", dump)
	}

	var serverSpan opentracing.Span

	if wireContext != nil {
		serverSpan = opentracing.StartSpan(
			f.spanName,
			ext.RPCServerOption(wireContext))
		ctx := opentracing.ContextWithSpan(request.Context(), serverSpan)
		request = request.WithContext(ctx)
	} else {
		log.Println("No wire context specified?")
	}

	f.wrapped.ServeHTTP(writer, request)
	serverSpan.Finish()
}
