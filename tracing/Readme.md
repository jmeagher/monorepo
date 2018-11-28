Basic Local Testing
---

1. Run Jaeger with (command from the Jaeger getting started guide) 
    ````docker run --rm --name jaeger \
      -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
      -p 5775:5775/udp \
      -p 6831:6831/udp \
      -p 6832:6832/udp \
      -p 5778:5778 \
      -p 16686:16686 \
      -p 14268:14268 \
      -p 9411:9411 \
      jaegertracing/all-in-one:1.7
      ````
1. Launch a flaky server with something like
    ````
    JAEGER_SERVICE_NAME=e2e_testing_server bazel run -- //tracing/server:flaky --success_rate=0.5 -port 8090 -errdelay=0.2s -debug=true
    ````
1. Launch a client with
    ````
    JAEGER_SERVICE_NAME=e2e_testing_client bazel run -- //tracing/client:test_client -port 8090 -host localhost
    ````

This will run a few requests through the system and should provide some traces in Jaeger. The traces should be available in the [search UI](http://localhost:16686/search).
