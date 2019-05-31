package httphelpers

import (
	"net/http"
	"net/http/httptest"
	"os"
)

func ExampleApacheStyleLogger() {
	okHandler := StaticHandler("all ok", "plain/text", 201)
	handler := ApacheStyleLogger(os.Stdout, okHandler)
	handler.clock = ReferenceClock()

	req, _ := http.NewRequest("POST", "/test", nil)
	req.RemoteAddr = "127.0.0.1"
	rr := httptest.NewRecorder()
	handler.ServeHTTP(rr, req)

	// Output:
	// 127.0.0.1 - - [2/Jan/2006:15:04:05 -0000] "POST /test HTTP/1.1" 201 6
}
