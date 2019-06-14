package httphelpers

import (
	"bytes"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"sync"
	"testing"

	logs "github.com/sirupsen/logrus"
	"github.com/sirupsen/logrus/hooks/test"
	"github.com/stretchr/testify/assert"
)

func ExampleStructuredLogger_simpleUse() {
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

func ExampleStructuredLogger_customFields() {
	logger := logs.New()
	logger.SetFormatter(&logs.TextFormatter{DisableTimestamp: true})
	logger.SetLevel(logs.DebugLevel)
	logger.Out = os.Stdout

	handler := NewStructuredLogger(logger, StaticHandler("test", "text/plain", 201))
	handler.DisableDuration = true

	handler.AddExtraFields(func(fields logs.Fields, logReq *LogRequest) {
		fields["my_custom"] = "test"
		fields["more_custom"] = logReq.OriginalRequest.URL.Path
	})

	req, _ := http.NewRequest("GET", "/test", nil)
	handler.ServeHTTP(httptest.NewRecorder(), req)

	// Output:
	// level=debug http.method=GET http.status_code=201 http.url_details.path=/test more_custom=/test my_custom=test network.bytes_read=0 network.bytes_written=4
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
	handler.AddExtraFields(func(fields logs.Fields, logReq *LogRequest) {
		fields["more_custom"] = logReq.OriginalRequest.URL.Path
	})

	var body []byte
	if bodySize > 0 {
		body = make([]byte, bodySize)
	}
	req, _ := http.NewRequest("GET", "/test", bytes.NewBuffer(body))
	for i := 0; i < b.N; i++ {
		handler.ServeHTTP(httptest.NewRecorder(), req)
	}
}

func TestConcurrentLogging(t *testing.T) {
	logger, hook := test.NewNullLogger()

	waiting := sync.WaitGroup{}
	wait := make(chan struct{})
	handler := NewStructuredLogger(logger, http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		waiting.Done()
		<-wait
	}))
	handler.IncludeConcurrentCount = true
	handler.Level = logs.ErrorLevel // So logs are output by default

	req, _ := http.NewRequest("GET", "/test", nil)
	wg := sync.WaitGroup{}
	for i := 0; i < 10; i++ {
		wg.Add(1)
		waiting.Add(1)
		go func() {
			defer wg.Done()
			handler.ServeHTTP(httptest.NewRecorder(), req)
		}()
	}

	// Wait until everything is inside the internal handler so they should all be concurrent
	waiting.Wait()
	// Close to allow the internal handler to proceed
	close(wait)
	// Wait for all internal handlers to finish
	wg.Wait()
	assert.Equal(t, 10, len(hook.Entries))
	min := 1000
	max := -1
	for _, e := range hook.Entries {
		raw := e.Data["concurrent"]
		vu, ok := raw.(uint32)
		if !ok {
			t.Fatalf("Concurrent field was not convertable to an int, got %#v", raw)
		}
		v := int(vu)
		if v < min {
			min = v
		}
		if v > max {
			max = v
		}
	}
	assert.Equal(t, 10, max)
	assert.Equal(t, 1, min)
}
