package handlers

import (
	"fmt"
	"math/rand"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"
)

// DelayHandler just delays, that's it
func DelayHandler(delay time.Duration, handler http.Handler) http.Handler {
	return &delayHandler{delay, handler}
}

type delayHandler struct {
	delay   time.Duration
	handler http.Handler
}

func (f *delayHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	time.Sleep(f.delay)
	f.handler.ServeHTTP(w, r)
}

// DebugRequestHandler lots request information going through it
func DebugRequestHandler(handler http.Handler) http.Handler {
	return &debugRequestHandler{handler}
}

type debugRequestHandler struct {
	handler http.Handler
}

func (f *debugRequestHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Starting debug dump ********")
	for name, headers := range r.Header {
		name = strings.ToLower(name)
		for _, h := range headers {
			fmt.Printf("    %v: %v\n", name, h)
		}
	}
	f.handler.ServeHTTP(w, r)
}

// StaticHandler to return a static bit of simple content
func StaticHandler(text string, mimeType string, code int) http.Handler {
	return &staticHandler{text, mimeType, code}
}

type staticHandler struct {
	text     string
	mimeType string
	code     int
}

func (f *staticHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", f.mimeType)
	w.WriteHeader(f.code)
	fmt.Fprintf(w, f.text)
}

// RandomSplitHandler randomly splits traffic between 2 handlers. option1Percent is a float between 0 and 1 that defines the
// split. 0.1 sends 10% of traffic to handler1 and the rest to handler2.
func RandomSplitHandler(option1Percent float32, handler1 http.Handler, handler2 http.Handler) http.Handler {
	return &randomSplitHandler{option1Percent, handler1, handler2}
}

type randomSplitHandler struct {
	option1Percent float32
	handler1       http.Handler
	handler2       http.Handler
}

func (f *randomSplitHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	h := f.handler1
	if rand.Float32() > f.option1Percent {
		h = f.handler2
	}
	h.ServeHTTP(w, r)
}

// TestRandomSplit functionality
func TestRandomSplit(t *testing.T) {
	h1 := StaticHandler("test", "plain/text", 200)
	h2 := StaticHandler("test", "plain/text", 400)
	h := RandomSplitHandler(0.9, h1, h2)
	successes := 0
	failures := 0
	for i := 0; i < 1000; i++ {
		r := httptest.NewRequest(http.MethodGet, "/", strings.NewReader(""))
		rr := httptest.NewRecorder()
		h.ServeHTTP(rr, r)
		switch rr.Code {
		case 200:
			successes++
		case 400:
			failures++
		default:
			t.Error(fmt.Sprintf("Got an unrecognized response code %d", rr.Code))
		}
	}
	if (successes + failures) != 1000 {
		t.Error("Didn't get a full set of responses")
	}
	if successes < 880 {
		t.Error("Didn't get enough successful responses")
	}
	if successes > 920 {
		t.Error("Didn't get enough successful responses")
	}
}
