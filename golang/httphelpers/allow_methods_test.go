package httphelpers

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestAllowMethods(t *testing.T) {
	handler := AllowMethodsHandler(StaticHandler("test", "plain/text", 201), "GET")
	req, _ := http.NewRequest("GET", "/test", nil)
	resp := httptest.NewRecorder()

	handler.ServeHTTP(resp, req)
	if status := resp.Code; status != 201 {
		t.Fatalf("Allowed request failed with status %d", status)
	}

	req, _ = http.NewRequest("POST", "/test", nil)
	resp = httptest.NewRecorder()

	handler.ServeHTTP(resp, req)
	if status := resp.Code; status != 405 {
		t.Fatalf("Request that should have been blocked wasn't with status %d", status)
	}
}
