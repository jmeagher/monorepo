package handlers

import (
	"fmt"
	"log"
	"net/http"

	"github.com/jmeagher/monorepo/golang/httphelpers"
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
	response, tmpRequest := httphelpers.CachedResponseWriter(writer, req)
	body, request, err1 := httphelpers.CachedHTTPRequestBody(tmpRequest)
	if err1 != nil {
		log.Println("Problem reading cached request body: ", err1)
	}
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
		serverSpan.SetTag("user_agent", request.Header.Get("User-Agent"))
		ctx := opentracing.ContextWithSpan(request.Context(), serverSpan)
		request = request.WithContext(ctx)

		opentracing.GlobalTracer().Inject(
			serverSpan.Context(),
			opentracing.HTTPHeaders,
			opentracing.HTTPHeadersCarrier(request.Header))

		finalStatus := func() {
			serverSpan.SetTag("request.bytes", len(body))
			serverSpan.SetTag("http.status", response.Status())
			serverSpan.SetTag("response.bytes", len(response.Body()))
			serverSpan.SetTag("error", response.Status() >= 500)
		}
		defer finalStatus()
	} else {
		log.Println("No wire context specified?")
	}

	f.wrapped.ServeHTTP(response, request)
}
