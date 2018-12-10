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
	wrap := WrapResponse(&writer)

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
			serverSpan.SetTag("http.status", wrap.StatusCode)
			serverSpan.SetTag("response.bytes", wrap.ResponseBytes)
			serverSpan.SetTag("error", wrap.StatusCode >= 500)
		}
		defer finalStatus()
	} else {
		log.Println("No wire context specified?")
	}

	f.wrapped.ServeHTTP(wrap, request)
}

func WrapResponse(writer *http.ResponseWriter) *ResponseWrapper {
	wrapper := ResponseWrapper{}
	wrapper.wrapped = writer
	return &wrapper
}

type ResponseWrapper struct {
	wrapped       *http.ResponseWriter
	StatusCode    int
	ResponseBytes int
}

func (w *ResponseWrapper) Header() http.Header {
	return (*w.wrapped).Header()
}

func (w *ResponseWrapper) Write(bytes []byte) (int, error) {
	w.ResponseBytes += len(bytes)
	return (*w.wrapped).Write(bytes)
}

func (w *ResponseWrapper) WriteHeader(status int) {
	w.StatusCode = status
	(*w.wrapped).WriteHeader(status)
}
