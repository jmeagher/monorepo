package httphelpers

import (
	"net/http"
	"sync/atomic"
	"time"

	logs "github.com/sirupsen/logrus"
)

// LogRequest pulls together all the key information about the request and response so any additional
// log fields can be saved
type LogRequest struct {
	RequestBody     []byte
	ResponseBody    []byte
	OriginalRequest *http.Request
	ResponseHeaders http.Header
}

// AddFields allows adding extra structured data based on the request and/or response
type AddFields func(logs.Fields, *LogRequest)

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

	// When set to true IncludeConcurrentCount outputs the number of concurrent requests
	// this logger is considering
	IncludeConcurrentCount bool

	extraLogging []AddFields
	logger       *logs.Logger
	nextHandler  http.Handler
	concurrent   uint32
}

func (r *StructuredLogger) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	var concurrentVal uint32
	if r.IncludeConcurrentCount {
		concurrentVal = atomic.AddUint32(&r.concurrent, 1)
		defer func() { atomic.AddUint32(&r.concurrent, ^uint32(0)) }()
	}
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

		if r.IncludeConcurrentCount {
			logFields["concurrent"] = concurrentVal
		}

		if len(r.extraLogging) != 0 {
			lr := &LogRequest{
				requestBody,
				resp.Body(),
				req,
				resp.Header(),
			}
			for _, adder := range r.extraLogging {
				adder(logFields, lr)
			}
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
// Returns the original structured logger for chaining.
func (r *StructuredLogger) CaptureRequestHeaders(headers ...string) *StructuredLogger {
	for _, header := range headers {
		r.CaptureRequestHeaderAs(header, header)
	}
	return r
}

// CaptureRequestHeaderAs outputs the value of the request header under the outputField.
// Example: log.CaptureRequestHeaderAs("User-Agent", "http.useragent")
// Returns the original structured logger for chaining.
func (r *StructuredLogger) CaptureRequestHeaderAs(header string, outputField string) *StructuredLogger {
	r.RequestHeaders[header] = outputField
	return r
}

// CaptureResponseHeaders is a helper to add response headers to capture under the same logged name as the header
// Returns the original structured logger for chaining.
func (r *StructuredLogger) CaptureResponseHeaders(headers ...string) *StructuredLogger {
	for _, header := range headers {
		r.CaptureResponseHeaderAs(header, header)
	}
	return r
}

// CaptureResponseHeaderAs outputs the value of the response header under the outputField.
// Example: log.CaptureRequestHeaderAs("Content-Type", "http.content-type")
// Returns the original structured logger for chaining.
func (r *StructuredLogger) CaptureResponseHeaderAs(header string, outputField string) *StructuredLogger {
	r.ResponseHeaders[header] = outputField
	return r
}

// AddExtraFields allows custom code to add more fields to the structured logs.
// Returns the original structured logger for chaining.
func (r *StructuredLogger) AddExtraFields(adder AddFields) *StructuredLogger {
	r.extraLogging = append(r.extraLogging, adder)
	return r
}
