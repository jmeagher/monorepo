package httphelpers

import (
	"net/http"
	"net/http/httptest"
	"os"

	logs "github.com/sirupsen/logrus"
)

func ExampleStructuredLogger() {
	logger := logs.New()
	logger.SetFormatter(&logs.TextFormatter{DisableTimestamp: true})
	logger.SetLevel(logs.DebugLevel)
	logger.Out = os.Stdout

	handler := NewStructuredLogger(logger, StaticHandler("test", "text/plain", 201))
	handler.DisableDuration = true
	handler.CaptureResponseHeaders("content-type", "non-existent-header")
	handler.CaptureRequestHeaderAs("x-some-custom-header", "my-header")

	req, _ := http.NewRequest("GET", "/test", nil)
	req.Header.Add("x-some-custom-header", "test-header")
	handler.ServeHTTP(httptest.NewRecorder(), req)

	// Note: time related output is disabled to make this testing easier

	// Output:
	// level=debug content-type=text/plain my-header=test-header non-existent-header= requestLength=0 responseCode=201 responseLength=4
}
