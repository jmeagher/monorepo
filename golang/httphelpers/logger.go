package httphelpers

import (
	"io"
	"net/http"
	"text/template"
	"time"
)

type AccessLogger struct {
	io.Writer
	*template.Template
	CapturedHeaders            []string
	CapturedOpenTracingBaggage []string
	NextHandler                http.Handler
	clock                      Clock
}

func ApacheStyleLogger(out io.Writer, nextHandler http.Handler) *AccessLogger {
	format := `{{or .clientIp "-"}} {{or .userIdentifier "-"}} {{or .userId "-"}} [{{.apacheTime}}] "{{.method}} {{.path}} {{.proto}}" {{.responseCode}} {{.responseLength}}`
	return TextTemplateLogger(out, nextHandler, format)
}

func TextTemplateLogger(out io.Writer, nextHandler http.Handler, outputTemplate string) *AccessLogger {
	logger := AccessLogger{}
	logger.Template, _ = template.New("").Parse(outputTemplate)
	logger.Writer = out
	logger.NextHandler = nextHandler
	return &logger
}

func (l *AccessLogger) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if l.clock == nil {
		l.clock = &realClock{}
	}

	vars := make(map[string]interface{})
	now := l.clock.Now()
	vars["time"] = now
	vars["apacheTime"] = now.Format("2/Jan/2006:15:04:05 -0000")
	vars["method"] = r.Method
	vars["path"] = r.URL.Path
	vars["proto"] = r.Proto
	vars["clientIp"] = r.RemoteAddr

	cache, newRequest := CachedResponseWriter(w, r)
	l.NextHandler.ServeHTTP(cache, newRequest)

	vars["responseCode"] = cache.Status()
	vars["responseLength"] = len(cache.Body())
	err := l.Template.Execute(l.Writer, vars)
	if err != nil {
		panic(err.Error())
	}
}

// TODO: Move this out to a better shared location
// Clock is a replacable clock implementation
// Initial version from https://stackoverflow.com/questions/18970265
type Clock interface {
	Now() time.Time
	After(d time.Duration) <-chan time.Time
}
type realClock struct{}

func (*realClock) Now() time.Time                         { return time.Now() }
func (*realClock) After(d time.Duration) <-chan time.Time { return time.After(d) }

// Static clock for testing
type staticClock struct {
	time.Time
}

func (t *staticClock) Now() time.Time                         { return t.Time }
func (t *staticClock) After(d time.Duration) <-chan time.Time { panic("Unsupported operation") }

// ReferenceClock for testing, see https://golang.org/pkg/time/#Time.Format
func ReferenceClock() Clock {
	return &staticClock{Time: time.Date(2006, 01, 02, 15, 04, 05, 0, time.UTC)}
}
