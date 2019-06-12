package httphelpers

import (
	"bytes"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

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
	handler.CaptureRequestHeaderAs("user-agent", "http.useragent")

	req, _ := http.NewRequest("GET", "/test", nil)
	req.Header.Add("x-some-custom-header", "test-header")
	req.Header.Add("User-Agent", "monorepo-test")
	handler.ServeHTTP(httptest.NewRecorder(), req)

	// Note: time related output is disabled to make this testing easier

	// Output:
	// level=debug content-type=text/plain http.method=GET http.status_code=201 http.url_details.path=/test http.useragent=monorepo-test my-header=test-header network.bytes_read=0 network.bytes_written=4 non-existent-header=
}

func BenchmarkNoBodyStructuredLogger(b *testing.B) { RunBenchmarkStructuredLogger(0, b) }
func Benchmark1KStructuredLogger(b *testing.B)     { RunBenchmarkStructuredLogger(1000, b) }
func Benchmark1MStructuredLogger(b *testing.B)     { RunBenchmarkStructuredLogger(1000*1000, b) }
func Benchmark10MStructuredLogger(b *testing.B)    { RunBenchmarkStructuredLogger(10*1000*1000, b) }

func RunBenchmarkStructuredLogger(bodySize int, b *testing.B) {
	logger := logs.New()
	logger.SetFormatter(&logs.TextFormatter{DisableTimestamp: true})
	logger.SetLevel(logs.DebugLevel)
	logger.Out = io.MultiWriter() // Blocks this from actually writing output

	b.ReportAllocs()

	handler := NewStructuredLogger(logger, StaticHandler("test", "text/plain", 201))
	var body []byte
	if bodySize > 0 {
		body = make([]byte, bodySize)
	}
	req, _ := http.NewRequest("GET", "/test", bytes.NewBuffer(body))
	for i := 0; i < b.N; i++ {
		handler.ServeHTTP(httptest.NewRecorder(), req)
	}
}
