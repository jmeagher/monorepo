package httphelpers

import (
	"context"
	"fmt"
	"io"
	"log"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func echoHandler(text string) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		if len(text) > 0 {
			io.WriteString(w, text)
		}
	}
}

func ExampleCachedHTTPRequestBody() {

	myHandler := func(w http.ResponseWriter, r *http.Request) {
		body, newRequest, err := CachedHTTPRequestBody(r)
		if err != nil {
			http.Error(w, "Problem reading cached request body", 500)
			return
		}
		// do something to use the body in some way, trivial example
		fmt.Println(len(body))
		// Do something with the new request like send it to another handler
		fmt.Println(newRequest.ContentLength)
		echoHandler("test")(w, newRequest)
	}
	req, err := http.NewRequest("POST", "/health-check", strings.NewReader("test123"))
	if err != nil {
		log.Panic(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(myHandler)
	handler.ServeHTTP(rr, req.WithContext(context.Background()))

	fmt.Println(rr.Code)
	// Output:
	// 7
	// 7
	// 200
}

func TestCachedHTTPRequestBody(t *testing.T) {

	t.Run("nil handling works", func(t *testing.T) {
		req, _ := http.NewRequest("GET", "/test", nil)
		body, newRequest, err := CachedHTTPRequestBody(req)
		if err != nil {
			t.Errorf("There should not have been an error")
		}
		if body != nil {
			t.Errorf("Body should be nil")
		}
		if req != newRequest {
			t.Errorf("Expected to get back the same request that was passed in")
		}
	})

	t.Run("caching really happens", func(t *testing.T) {
		req, _ := http.NewRequest("POST", "/test", strings.NewReader("test123"))
		body, newRequest, err := CachedHTTPRequestBody(req.WithContext(context.Background()))
		if err != nil {
			t.Errorf("There should not have been an error")
		}
		if body == nil {
			t.Errorf("Body should not be nil")
		}
		if req == newRequest {
			t.Errorf("Expected to get back a different request than was passed in")
		}
		str := string(body)
		if str != "test123" {
			t.Errorf("Captured body mismatch")
		}

		body2, req2, _ := CachedHTTPRequestBody(newRequest)
		if req2 != newRequest {
			t.Errorf("Request should have been unmodified for the second call")
		}
		str2 := string(body2)
		if str2 != "test123" {
			t.Errorf("Cached body mismatch")
		}
		v := req2.Context().Value(requestBodyKey)
		if v == nil {
			t.Errorf("Context doesn't have the cached body")
		}
	})

}

func ExampleCachedResponseWriter() {
	myHandler := func(w http.ResponseWriter, r *http.Request) {
		cache, newRequest := CachedResponseWriter(w, r)
		// Send the cached request and writer down the chain
		echoHandler("test")(cache, newRequest)
		// Use the cached version of the response body
		fmt.Println(string(cache.Body()))
	}
	req, err := http.NewRequest("POST", "/health-check", strings.NewReader("test123"))
	if err != nil {
		log.Panic(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(myHandler)
	handler.ServeHTTP(rr, req.WithContext(context.Background()))

	fmt.Println(rr.Code)
	// Output:
	// test
	// 200
}

func TestCachedResponseWriter(t *testing.T) {
	t.Run("cachedResponseHolder is a responseWriter", func(t *testing.T) {
		var rw http.ResponseWriter = &cachedResponseHolder{}
		if rw == nil {
			t.Errorf("silly check")
		}
	})

	t.Run("no response body works", func(t *testing.T) {
		req, _ := http.NewRequest("GET", "/test", nil)
		req2 := req.WithContext(context.Background())
		var rr http.ResponseWriter = httptest.NewRecorder()
		cache, newRequest := CachedResponseWriter(rr, req2)
		if cache == nil {
			t.Errorf("Cache should not be nil")
		}
		if req2 == newRequest {
			t.Errorf("Expected to get back a different request than was passed in")
		}

		handler := http.HandlerFunc(echoHandler(""))
		handler.ServeHTTP(cache, newRequest)
		if len(cache.Body()) != 0 {
			t.Errorf("Expected empty cached body")
		}
	})

	t.Run("it really caches", func(t *testing.T) {
		req, _ := http.NewRequest("GET", "/test", nil)
		req2 := req.WithContext(context.Background())
		var rr http.ResponseWriter = httptest.NewRecorder()
		cache1, newRequest1 := CachedResponseWriter(rr, req2)
		if req2 == newRequest1 {
			t.Errorf("Expected to get back a different request than was passed in")
		}

		cache2, newRequest2 := CachedResponseWriter(cache1, newRequest1)
		if newRequest2 != newRequest1 {
			t.Errorf("Expected already cached request to be unchanged")
		}
		if cache1 != cache2 {
			t.Errorf("Expected already cached response writer to be unchanged")
		}

		handler := http.HandlerFunc(echoHandler("test"))
		handler.ServeHTTP(cache2, newRequest2)
		if len(cache2.Body()) != 4 {
			t.Errorf("Expected cached2 body to work")
		}
	})

}
