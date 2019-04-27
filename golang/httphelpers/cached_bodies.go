package httphelpers

import (
	"bytes"
	"context"
	"io/ioutil"
	"net/http"
)

type cacheKey string

var requestBodyKey = cacheKey("jmeagher_cached_request")
var cachedResponseKey = cacheKey("jmeagher_cached_response")

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

// CachedResponse provides access to the response body and response Status code
// when passed down to any additional handlers.
// (see CachedResponseWriter)
type CachedResponse interface {
	Body() []byte
	Status() int

	http.ResponseWriter
}

type cachedResponseHolder struct {
	wrapped      http.ResponseWriter
	cachedBody   []byte
	cachedStatus int
}

// CachedResponseWriter returns a CachedResponse and *http.Request that
// can be passed down to other handlers. This allows the response body
// to be captured in the CachedResponse. If this has already been used
// in the stack the response body will only be stored once.
func CachedResponseWriter(rw http.ResponseWriter, request *http.Request) (CachedResponse, *http.Request) {
	ctx := request.Context()

	if v := ctx.Value(cachedResponseKey); v != nil {
		// It's already cached
		return v.(*cachedResponseHolder), request
	}

	cache := cachedResponseHolder{}
	cache.wrapped = rw

	newCtx := context.WithValue(ctx, cachedResponseKey, &cache)
	newRequest := request.WithContext(newCtx)
	return &cache, newRequest
}

// Body returns the cached body from the response
func (c *cachedResponseHolder) Body() []byte {
	return c.cachedBody
}

// Status returns the cached status code from the response
func (c *cachedResponseHolder) Status() int {
	return c.cachedStatus
}

// Header passes through to the wrapped *http.ResponseWriter
func (c *cachedResponseHolder) Header() http.Header {
	return c.wrapped.Header()
}

// Write captures the bytes in the CachedResponse and passes
// the call to the *http.ResponseWriter
func (c *cachedResponseHolder) Write(data []byte) (int, error) {
	c.cachedBody = append(c.cachedBody, data...)
	return c.wrapped.Write(data)
}

// WriteHeader captures the status in the CachedResponse and passes
// the call to the *http.ResponseWriter
func (c *cachedResponseHolder) WriteHeader(statusCode int) {
	c.cachedStatus = statusCode
	c.wrapped.WriteHeader(statusCode)
}
