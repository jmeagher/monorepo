Basic Local Testing
---

1. Run Jaeger with 
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
    JAEGER_SERVICE_NAME=e2e_testing_server entr -r bazel run -- //tracing/server:flaky --flakepct=0.5 --port 8090 -errdelay 0.2s
    ````
1. Launch a client with
    ````
    JAEGER_SERVICE_NAME=e2e_testing_client entr bazel run -- //tracing/jaeger:test_client --port 8090 --host localhost
    ````

This will run a few requests through the system and should provide some traces in Jaeger. The traces should be available in the [search UI](http://localhost:16686/search).