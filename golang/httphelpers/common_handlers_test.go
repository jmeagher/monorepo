package httphelpers

import (
	"fmt"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func testSplitHandler(t *testing.T, split http.Handler, expectedSuccessRatio float32) {
	successes := 0
	failures := 0
	count := 1000
	for i := 0; i < count; i++ {
		r := httptest.NewRequest(http.MethodGet, "/", strings.NewReader(""))
		rr := httptest.NewRecorder()
		split.ServeHTTP(rr, r)
		switch rr.Code {
		case 200:
			successes++
		case 400:
			failures++
		default:
			t.Error(fmt.Sprintf("Got an unrecognized response code %d", rr.Code))
		}
	}
	if (successes + failures) != count {
		t.Errorf("Didn't get a full set of responses, expected %v, but got %v", count, successes+failures)
	}

	min := int(float32(count) * expectedSuccessRatio * 0.95)
	max := int(float32(count) * expectedSuccessRatio * 1.05)
	if successes < min {
		t.Errorf("Didn't get enough successful responses, got %v, but expected at least %v", successes, min)
	}
	if successes > max {
		t.Errorf("Got too many successful responses, got %v, but expected less than %v", successes, max)
	}
}

func TestRandomSplitHandler(t *testing.T) {
	h1 := StaticHandler("test", "plain/text", 200)
	h2 := StaticHandler("test", "plain/text", 400)
	h := RandomSplitHandler(0.9, h1, h2)
	testSplitHandler(t, h, 0.9)
}

func TestEvenSplitHandler(t *testing.T) {
	h1 := StaticHandler("test", "plain/text", 200)
	h2 := StaticHandler("test", "plain/text", 400)
	h := EvenSplitHandler(h1, h2)
	testSplitHandler(t, h, 0.5)
}
