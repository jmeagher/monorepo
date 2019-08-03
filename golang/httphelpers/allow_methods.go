package httphelpers

import (
	"net/http"
)

type allowMethods struct {
	nextHandler    http.Handler
	allowedMethods map[string]bool
}

// AllowMethodsHandler will pass through any requests using a method in the allowed list.
// Anything not in the list gets rejected with http.StatusMethodNotAllowed
func AllowMethodsHandler(handler http.Handler, allowedMethods ...string) http.Handler {
	allowed := make(map[string]bool, len(allowedMethods))
	for _, m := range allowedMethods {
		allowed[m] = true
	}
	return &allowMethods{handler, allowed}
}

func (r *allowMethods) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	method := req.Method
	if _, ok := r.allowedMethods[method]; ok {
		r.nextHandler.ServeHTTP(w, req)
	} else {
		w.WriteHeader(http.StatusMethodNotAllowed)
	}
}
