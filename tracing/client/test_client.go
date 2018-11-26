package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"sync"
	"time"

	"github.com/jmeagher/monorepo/tracing/jaeger"
	opentracing "github.com/opentracing/opentracing-go"

	"github.com/opentracing/opentracing-go/ext"
)

func main() {
	port := flag.Int("port", 8080, "port to listen on")
	host := flag.String("host", "localhost", "host to connect to")
	requestCount := flag.Int("requests", 10, "number of test requests to make")
	parallelism := flag.Int("parallelism", 1, "requests to make in parallel")
	expectedSuccessRate := flag.Float64("expected_sr", -1, "The expected success rate, if set between 0.0 and 1.0 this will cause the process to fail if the success rate is not close to this setting")
	expectedSuccessRateThreshold := flag.Float64("sr_threshold", 0.05, "Sets the range +- the expected_sr that is acceptable for the expected_sr check")
	flag.Parse()

	url := fmt.Sprintf("http://%s:%d", *host, *port)
	log.Printf("Using server URL: %v\n", url)

	min := *expectedSuccessRate - *expectedSuccessRateThreshold
	max := *expectedSuccessRate + *expectedSuccessRateThreshold

	status, success := runTest(url, *requestCount, min, max, *parallelism)
	if success {
		log.Println(success)
	} else {
		log.Fatalln(status)
	}
}

func runTest(url string, count int, minSr float64, maxSr float64, parallelism int) (string, bool) {
	var closer, err = jaeger.Init()
	if err != nil {
		log.Fatal("Jaeger Init Fail: ", err)
	}
	defer closer.Close()

	requests := make(chan int, parallelism)
	go func() {
		for i := 0; i < count; i++ {
			requests <- i
		}
		close(requests)
	}()

	var wg sync.WaitGroup
	results := make(chan bool, count)
	wg.Add(count)

	for i := 0; i < parallelism; i++ {
		go asyncTest(requests, url, results, &wg)
	}

	done := make(chan struct{})
	go func() {
		wg.Wait()
		close(done)
	}()

	select {
	case <-done:
	// All done!
	case <-time.After(50 * time.Second):
		log.Println("Warning: Hit timeout and did not get full results")
	}

	close(results)
	var successes, failures int
	for i := range results {
		if i {
			successes++
		} else {
			failures++
		}
	}

	successRate := float64(successes) / float64(successes+failures)
	if successRate < minSr {
		return fmt.Sprintf("Success rate was %v which is less than the min of %v", successRate, minSr), false
	}
	if successRate > maxSr {
		return fmt.Sprintf("Success rate was %v which is more than the max of %v\n", successRate, maxSr), false
	}
	return fmt.Sprintf("Got a good success rate of %v\n", successRate), true
}

func asyncTest(runNum chan int, url string, result chan bool, wg *sync.WaitGroup) {

	for i := range runNum {
		var response, err = doTest(i, url)
		var success = true
		if err != nil {
			log.Printf("Test error: %s", err.Error())
			success = false
		} else if response == nil || response.StatusCode >= 300 {
			success = false
		}
		result <- success
		wg.Done()
	}
}

func doTest(testRun int, url string) (*http.Response, error) {
	sp := opentracing.StartSpan("test_request")
	defer sp.Finish()
	ext.SamplingPriority.Set(sp, 1)
	sp.SetTag("request_num", testRun)
	ctx := opentracing.ContextWithSpan(context.Background(), sp)
	return doRequest(ctx, url)
}

func doRequest(context context.Context, url string) (*http.Response, error) {
	span := opentracing.SpanFromContext(context)

	httpClient := &http.Client{}
	httpReq, _ := http.NewRequest("GET", url, nil)

	httpReq.Header.Set("x-my-client-name", os.Getenv("JAEGER_SERVICE_NAME"))

	// Transmit the span's TraceContext as HTTP headers on our
	// outbound request.
	opentracing.GlobalTracer().Inject(
		span.Context(),
		opentracing.HTTPHeaders,
		opentracing.HTTPHeadersCarrier(httpReq.Header))

	sp := opentracing.StartSpan(
		"client_call",
		opentracing.ChildOf(span.Context()))
	defer sp.Finish()
	resp, err := httpClient.Do(httpReq)

	if resp != nil {
		sp.SetTag("http.status", resp.StatusCode)
	}
	return resp, err
}
