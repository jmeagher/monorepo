package httphelpers

import (
	"fmt"
	"math/rand"
	"net/http"
	"strings"
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

// EvenSplitHandler splits traffic randomly between the handlers
func EvenSplitHandler(handlers ...http.Handler) http.Handler {
	size := len(handlers)
	if size == 0 {
		panic("no handlers were passed in")
	}
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		idx := rand.Intn(size)
		handlers[idx].ServeHTTP(w, r)
	})

}
