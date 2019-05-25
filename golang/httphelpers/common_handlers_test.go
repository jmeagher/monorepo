package handlers

import (
	"fmt"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

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
