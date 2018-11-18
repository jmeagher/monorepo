#! /bin/bash

set -xeuo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill
    docker kill simple_jaeger_proxy || true
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

#bazel run //tracing/envoyproxy:simple_jaeger \
# && docker run --rm -d --name simple_jaeger_proxy -p 9090:10000 \
#    bazel/tracing/envoyproxy:simple_jaeger || finish 1 "Docker run failed"

echo "Starting Flaky server"
JAEGER_SERVICE_NAME=flaky_server bazel run \
    -- //tracing/server:flaky -flakepct=0.5 -port 18090 -debug=true &

sleep 3s

echo "Simple test of the basic jaeger proxy"
JAEGER_SERVICE_NAME=simple_jaeger_test_client \
  bazel run -- //tracing/jaeger:test_client -port 18090 -host localhost -requests 5 || finish 1 "client failed"

echo "Check for the jaeger span for the client"
curl "http://localhost:16686/api/traces?limit=20&lookback=1h&service=simple_jaeger_test_client"

finish 0 "Test looks successful"