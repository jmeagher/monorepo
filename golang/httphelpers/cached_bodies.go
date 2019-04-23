package httphelpers

import (
	"bytes"
	"context"
	"io/ioutil"
	"net/http"
)

type cacheKey string

var requestBodyKey = cacheKey("jmeagher_cached_bodies.request")

// CachedHTTPRequestBody returns the body of the request
// and stores a version of it in the returned request.
// If this is used multiple times within the same request chain
// only one copy of the body will be in memory.
func CachedHTTPRequestBody(request *http.Request) ([]byte, *http.Request, error) {
	if request.Body == nil {
		// Nothing to cache
		return nil, request, nil
	}

	ctx := request.Context()

	if v := ctx.Value(requestBodyKey); v != nil {
		// It's already cached
		return v.([]byte), request, nil
	}

	body, err := ioutil.ReadAll(request.Body)
	if err != nil {
		return nil, nil, err
	}

	newCtx := context.WithValue(ctx, requestBodyKey, body)

	newRequest := request.WithContext(newCtx)
	newRequest.Body = ioutil.NopCloser(bytes.NewBuffer(body))
	return body, newRequest, nil
}
