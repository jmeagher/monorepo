#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    (cd tracing && docker-compose down -v || echo "Docker compose down problem")
    exit $1
}

source tracing/common_stuff.sh

(cd tracing && docker-compose up -d simple_retry_envoy)

echo Wait for startup of servers
dockerize \
  -wait http://$SERVICE_HOST:10002 \
  -wait http://$SERVICE_HOST:11001 \
  -timeout 20s || finish 1 "Servers appear to not be started"

echo "Check SR when querying through the proxy"
JAEGER_SERVICE_NAME=e2e_retry_client \
  bazel run \
    -- //tracing/client:test_client -host=localhost -port 10002 \
    -expected_sr=0.91 -sr_threshold=0.02 -requests=300 \
    || finish 1 "Success rate failure"

finish 0 "Test looks successful"
