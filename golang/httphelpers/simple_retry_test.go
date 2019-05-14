package httphelpers

import (
	"fmt"
	"net/http"
	"net/http/httptest"
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
