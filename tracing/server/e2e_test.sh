#! /bin/bash

set -euo pipefail

finish() {
    echo ""
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    (cd tracing && docker-compose down -v || echo "Docker compose down problem")
    exit $1
}

source tracing/common_stuff.sh
images server:flaky_image

(cd tracing && docker-compose up -d flaky1 jaeger)

# Wait for the server to start
echo Wait for startup of servers
dockerize \
  -wait http://$SERVICE_HOST:11001 \
  -wait http://$SERVICE_HOST:16686 \
  -timeout 20s || finish 1 "Servers appear to not be started"

echo "Check Flaky Percent"
JAEGER_SERVICE_NAME=e2e_flake_client \
  bazel run \
    -- //tracing/client:test_client -host=localhost -port 11001 \
    -expected_sr=0.7 -sr_threshold=0.03 -requests=10000 -parallelism=10 \
    || finish 1 "Success rate is not what was expected"

echo "Make sure the SR test works by intentionally failing it"
JAEGER_SERVICE_NAME=e2e_fail_client \
  bazel run \
    -- //tracing/client:test_client -host=localhost -port 11001 \
    -expected_sr=0.99 -sr_threshold=0.00001 -requests=100 \
    && finish 1 "Success rate test should have failed here"

echo "Validate that tracing is really working"
ID=$RANDOM
curl -H "Uber-Trace-Id: $ID:$ID:0:3" localhost:11001
sleep 1s
curl -v http://localhost:16686/api/traces/$ID | grep "\"traceID\":\"$ID\"" && FOUND=true || FOUND=false
if [[ $FOUND != true ]] ; then
  finish 1 "Did not find the trace in Jaeger"
fi

finish 0 "Test looks successful"
