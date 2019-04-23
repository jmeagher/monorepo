package httphelpers

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

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
