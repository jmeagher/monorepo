package httphelpers

import (
	"net/http"
	"time"

	logs "github.com/sirupsen/logrus"
)

// NewStructuredLogger builds a basic logger that can then be customized
func NewStructuredLogger(logger *logs.Logger, nextHandler http.Handler) *StructuredLogger {
	return &StructuredLogger{
		logger:          logger,
		nextHandler:     nextHandler,
		RequestHeaders:  make(map[string]string),
		ResponseHeaders: make(map[string]string),
		Level:           logs.DebugLevel,
	}
}

// StructuredLogger controls what gets logged for each request
type StructuredLogger struct {
	// DisableDuration allows turning off the logging of request duration.
	// This is mostly for testing. Defaults to false
	DisableDuration bool

	// RequestHeaders is a map from incoming request header names to the field name
	// they should be logged as.
	RequestHeaders map[string]string

	// ResponseHeaders is a map from the response header names to the field name
	// they should be logged as.
	ResponseHeaders map[string]string

	// The log level used for outputting the logs. Defaults to logrus.DebugLevel
	logs.Level

	logger      *logs.Logger
	nextHandler http.Handler
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
		logFields["http.method"] = req.Method
		logFields["http.status_code"] = resp.Status()
		logFields["network.bytes_read"] = len(requestBody)
		logFields["network.bytes_written"] = len(resp.Body())
		if !r.DisableDuration {
			logFields["duration_seconds"] = time.Now().Sub(startTime).Seconds()
		}

		toLog := r.logger.WithFields(logFields)
		toLog = toLog.WithFields(logHeaders(req.Header, r.RequestHeaders))
		toLog = toLog.WithFields(logHeaders(resp.Header(), r.ResponseHeaders))
		toLog.Log(r.Level)
	}
	defer logFunc()
	r.nextHandler.ServeHTTP(resp, newRequest)
}

func logHeaders(header http.Header, toCapture map[string]string) logs.Fields {
	fields := logs.Fields{}
	for inKey, outKey := range toCapture {
		fields[outKey] = header.Get(inKey)
	}
	return fields
}

// CaptureRequestHeaders is a helper to add request headers to capture under the same logged name as the header
func (r *StructuredLogger) CaptureRequestHeaders(headers ...string) {
	for _, header := range headers {
		r.CaptureRequestHeaderAs(header, header)
	}
}

// CaptureRequestHeaderAs outputs the value of the request header under the outputField.
// Example: log.CaptureRequestHeaderAs("User-Agent", "http.useragent")
func (r *StructuredLogger) CaptureRequestHeaderAs(header string, outputField string) {
	r.RequestHeaders[header] = outputField
}

// CaptureResponseHeaders is a helper to add response headers to capture under the same logged name as the header
func (r *StructuredLogger) CaptureResponseHeaders(headers ...string) {
	for _, header := range headers {
		r.CaptureResponseHeaderAs(header, header)
	}
}

// CaptureResponseHeaderAs outputs the value of the response header under the outputField.
// Example: log.CaptureRequestHeaderAs("Content-Type", "http.content-type")
func (r *StructuredLogger) CaptureResponseHeaderAs(header string, outputField string) {
	r.ResponseHeaders[header] = outputField
}
