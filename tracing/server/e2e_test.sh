#! /bin/bash

set -euo pipefail

PORT=18088
SERVER_SUCCESS_RATE=0.25

finish() {
    echo ""
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    docker kill jaeger || true
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill || true
    exit $1
}

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

echo "Starting Flaky server"
JAEGER_SERVICE_NAME=e2e_testing_server \
  bazel run \
    -- //tracing/server:flaky -flakepct=$SERVER_SUCCESS_RATE -port $PORT &

# Wait for the server to start
echo Wait for startup of servers
while ! curl -s localhost:$PORT > /dev/null ; do
  sleep 0.1
done
sleep 3s

echo "Check Flaky Percent"
JAEGER_SERVICE_NAME=e2e_flake_client \
  bazel run \
    -- //tracing/jaeger:test_client -host=localhost -port $PORT \
    -expected_sr=$SERVER_SUCCESS_RATE -requests=100 \
    || finish 1 "Success rate is not what was expected"

echo "Make sure the SR test works by intentionall failing it"
JAEGER_SERVICE_NAME=e2e_fail_client \
  bazel run \
    -- //tracing/jaeger:test_client -host=localhost -port $PORT \
    -expected_sr=0.99 -sr_threshold=0.00001 -requests=100 \
    && finish 1 "Success rate test should have failed here"

echo "Validate that tracing is really working"
ID=$RANDOM
curl -H "Uber-Trace-Id: $ID:$ID:0:3" localhost:$PORT
sleep 1s
curl -v http://localhost:16686/api/traces/$ID | grep "\"traceID\":\"$ID\"" && FOUND=true || FOUND=false
if [[ $FOUND != true ]] ; then
  finish 1 "Did not find the trace in Jaeger"
fi

finish 0 "Test looks successful"
