#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    docker kill jaeger || true
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill || true
    docker kill simple_jaeger_proxy || true
    exit $1
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  SERVICE_HOST=172.17.0.1
elif [[ "$OSTYPE" == "darwin"* ]]; then
  SERVICE_HOST=host.docker.internal
fi

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

echo "Starting all-in-one Jaeger server"
docker run --rm --name jaeger \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.7 &

bazel run //tracing/envoyproxy:simple_jaeger \
&& docker run -d --rm --name simple_jaeger_proxy -p 9090:10000 \
   -e SERVICE_HOST=$SERVICE_HOST -e SERVICE_PORT=10001 \
   bazel/tracing/envoyproxy:simple_jaeger || finish 1 "Docker run failed"

echo "Starting Flaky server"
JAEGER_SERVICE_NAME=flaky_server bazel run \
    -- //tracing/server:flaky --success_rate=0.5 -port 10001 -debug=true &

sleep 8s

echo "Validate that tracing is really working"
ID=$RANDOM
curl -H "Uber-Trace-Id: $ID:$ID:0:3" localhost:9090 || finish 1 "curl failed"
sleep 5s
curl -v http://localhost:16686/api/traces/$ID || true
if [ "$(curl -v http://localhost:16686/api/traces/$ID | grep -o "\"traceID\":\"$ID\"" | wc -l)" != "7" ] ; then
  finish 1 "Did not find the trace in Jaeger"
fi


echo "Bulk test of the jaeger proxy"
JAEGER_SERVICE_NAME=simple_jaeger_test_client \
  bazel run -- //tracing/client:test_client -port 9090 \
  -host localhost -expected_sr=0.5 -sr_threshold=0.3 -requests 10 || finish 1 "client failed"

echo "Check for the jaeger span for the client"
curl "http://localhost:16686/api/traces?limit=20&lookback=1h&service=simple_jaeger_test_client"


finish 0 "Test looks successful"
