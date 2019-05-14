package httphelpers

import (
	"net/http"
	"net/http/httptest"
)

type retryHandler struct {
	handlers []http.Handler
	ErrorDetector
}

// SimpleRetryHandler will pass calls through a chain of http.Handler
// implementations until one is detected as not an error
func SimpleRetryHandler(handlers ...http.Handler) http.Handler {
	return &retryHandler{handlers, Simple5xxErrorHandler()}
}

// RetryHandler will pass calls through a chain of http.Handler
// implementations until one is detected as not an error
func RetryHandler(detector ErrorDetector, handlers ...http.Handler) http.Handler {
	return &retryHandler{handlers, detector}
}

func (r *retryHandler) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	if len(r.handlers) == 0 {
		// Nothing to do
		return
	}

	_, newRequest, err := CachedHTTPRequestBody(req)
	if err != nil {
		http.Error(w, "Problem reading cached request body", 500)
		return
	}

	var resp *httptest.ResponseRecorder
	for _, handler := range r.handlers {
		resp = httptest.NewRecorder()
		handler.ServeHTTP(resp, newRequest)
		if !r.ErrorDetector.IsError(resp) {
			break
		}
	}

	// TODO: validate this, it's probably missing some key edge cases
	respHeader := w.Header()
	for k, values := range resp.HeaderMap {
		for _, v := range values {
			respHeader.Add(k, v)
		}
	}
	w.WriteHeader(resp.Code)
	w.Write(resp.Body.Bytes())
}

// ErrorDetector allows a custom implementation for detecting if a response
// is an error or not.
type ErrorDetector interface {
	IsError(*httptest.ResponseRecorder) bool
}

// ErrorDetectorFunc allows using a simple function as
// an ErrorDetector
type ErrorDetectorFunc func(*httptest.ResponseRecorder) bool

// IsError delegates to the ErrorDetectorFunc implementation
func (e ErrorDetectorFunc) IsError(resp *httptest.ResponseRecorder) bool {
	return e(resp)
}

// Simple5xxErrorHandler treats any response code 500 and above as an error
func Simple5xxErrorHandler() ErrorDetector {
	return ErrorDetectorFunc(func(resp *httptest.ResponseRecorder) bool {
		return resp.Code >= 500
	})

}
