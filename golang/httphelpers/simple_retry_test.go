package httphelpers

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func ExampleSimpleRetryHandler() {
	status500Handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(500)
		fmt.Println("error handler")
	})
	status301Handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(301)
		fmt.Println("redirect handler")
	})

	status201Handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(201)
		fmt.Println("ok handler")
	})

	req, _ := http.NewRequest("GET", "/test", nil)

	retrier := SimpleRetryHandler(status500Handler, status301Handler, status201Handler)
	rr := httptest.NewRecorder()
	retrier.ServeHTTP(rr, req)
	fmt.Println("status", rr.Code)

	err3xx := ErrorDetectorFunc(func(r *httptest.ResponseRecorder) bool {
		return r.Code >= 300
	})
	retrier2 := RetryHandler(err3xx, status500Handler, status301Handler, status201Handler)
	rr2 := httptest.NewRecorder()
	retrier2.ServeHTTP(rr2, req)
	fmt.Println("status", rr2.Code)

	// Output:
	// error handler
	// redirect handler
	// status 301
	// error handler
	// redirect handler
	// ok handler
	// status 201
}

func testRunner(t *testing.T, handler http.Handler, runner func(t *testing.T, handler http.Handler)) {
	wrappedHandler := SimpleRetryHandler(handler)
	// Ensure the retry wrapper works the same as the direct handler
	t.Run("direct handler", func(t *testing.T) {
		runner(t, handler)
	})
	t.Run("wrapped handler", func(t *testing.T) {
		runner(t, wrappedHandler)
	})
}

func TestGetHandling(t *testing.T) {
	basicGet := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(201)
		w.Header().Set("Content-Type", "plain/text")
		w.Header().Set("X-test-header", "hi")
		fmt.Fprintf(w, "testing %s %s", r.Method, r.URL.Path)
	})
	getValidation := func(t *testing.T, handler http.Handler) {
		req, _ := http.NewRequest("GET", "/test", nil)
		resp := httptest.NewRecorder()

		handler.ServeHTTP(resp, req)
		body, err1 := ioutil.ReadAll(resp.Body)
		if err1 != nil {
			t.Fatal(err1)
		}
		if string(body) != "testing GET /test" {
			t.Fatalf("Body validation error '%s'", body)
		}

		if ct := resp.HeaderMap.Get("Content-Type"); ct != "plain/text" {
			t.Fatalf("content type validation failure '%s'", ct)
		}

		if status := resp.Code; status != 201 {
			t.Fatalf("status validation fail %d", status)
		}

		if custHeader := resp.HeaderMap.Get("X-test-header"); custHeader != "hi" {
			t.Fatalf("custom header failed '%s'", custHeader)
		}
	}
	testRunner(t, basicGet, getValidation)
}

func TestPostHandling(t *testing.T) {
	basicpost := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(201)
		w.Header().Set("Content-Type", r.Header.Get("Content-Type"))
		body, _ := ioutil.ReadAll(r.Body)
		fmt.Fprintf(w, "testing %s %s ", r.Method, r.URL.Path)
		w.Write(body)
	})
	postValidation := func(t *testing.T, handler http.Handler) {
		req, _ := http.NewRequest("POST", "/test", strings.NewReader("post test"))
		req.Header.Set("Content-Type", "plain/text")
		resp := httptest.NewRecorder()

		handler.ServeHTTP(resp, req)
		body, err1 := ioutil.ReadAll(resp.Body)
		if err1 != nil {
			t.Fatal(err1)
		}
		if string(body) != "testing POST /test post test" {
			t.Fatalf("Body validation error '%s'", body)
		}

		if ct := resp.HeaderMap.Get("Content-Type"); ct != "plain/text" {
			t.Fatalf("content type validation failure '%s'", ct)
		}

		if status := resp.Code; status != 201 {
			t.Fatalf("status validation fail %d", status)
		}
	}
	testRunner(t, basicpost, postValidation)
}
