package httphelpers

import (
	"net/http"
	"time"

	logs "github.com/sirupsen/logrus"
)

func NewStructuredLogger(logger *logs.Logger, nextHandler http.Handler) *StructuredLogger {
	return &StructuredLogger{
		Logger:          logger,
		NextHandler:     nextHandler,
		RequestHeaders:  make(map[string]string),
		ResponseHeaders: make(map[string]string),
	}
}

type StructuredLogger struct {
	Logger          *logs.Logger
	NextHandler     http.Handler
	DisableDuration bool
	RequestHeaders  map[string]string
	ResponseHeaders map[string]string
}

func (r *StructuredLogger) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	requestBody, newRequest, err := CachedHTTPRequestBody(req)
	if err != nil {
		http.Error(w, "Problem reading cached request body", 500)
		return
	}
	resp, newRequest := CachedResponseWriter(w, newRequest)

	startTime := time.Now()
	logFunc := func() {
		logFields := logs.Fields{}

		logFields["http.url_details.path"] = req.URL.Path
		logFields["http.methd"] = req.Method
		logFields["http.status_code"] = resp.Status()
		logFields["network.bytes_read"] = len(requestBody)
		logFields["network.bytes_written"] = len(resp.Body())
		if !r.DisableDuration {
			logFields["duration_seconds"] = time.Now().Sub(startTime).Seconds()
		}

		toLog := r.Logger.WithFields(logFields)
		toLog = toLog.WithFields(logHeaders(req.Header, r.RequestHeaders))
		toLog = toLog.WithFields(logHeaders(resp.Header(), r.ResponseHeaders))
		toLog.Debug()
	}
	defer logFunc()
	r.NextHandler.ServeHTTP(resp, newRequest)
}

func logHeaders(header http.Header, toCapture map[string]string) logs.Fields {
	fields := logs.Fields{}
	for inKey, outKey := range toCapture {
		fields[outKey] = header.Get(inKey)
	}
	return fields
}

func (r *StructuredLogger) CaptureRequestHeaders(headers ...string) {
	for _, header := range headers {
		r.RequestHeaders[header] = header
	}
}

func (r *StructuredLogger) CaptureRequestHeaderAs(header string, outputField string) {
	r.RequestHeaders[header] = outputField
}

func (r *StructuredLogger) CaptureResponseHeaders(headers ...string) {
	for _, header := range headers {
		r.ResponseHeaders[header] = header
	}
}
func (r *StructuredLogger) CaptureResponseHeaderAs(header string, outputField string) {
	r.ResponseHeaders[header] = outputField
}
