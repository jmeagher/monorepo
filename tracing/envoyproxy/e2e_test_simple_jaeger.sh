#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    (cd tracing && docker-compose down -v || echo "Docker compose down problem")
    exit $1
}

source tracing/common_stuff.sh

(cd tracing && docker-compose up -d simple_jaeger_envoy jaeger)

echo Wait for startup of servers
dockerize \
  -wait http://$SERVICE_HOST:10001 \
  -wait http://$SERVICE_HOST:11001 \
  -wait http://$SERVICE_HOST:16686 \
  -timeout 20s || finish 1 "Servers appear to not be started"

sleep 1s

echo "Validate that tracing is really working"
ID=$RANDOM
curl -vf -H "Uber-Trace-Id: $ID:$ID:0:3" localhost:10001 || finish 1 "curl failed"
dockerize \
  -wait http://$SERVICE_HOST:16686/api/traces/$ID \
  -timeout 20s || finish 1 "Trace did not show up in Jaeger"

sleep 10s  # Gotta wait a while for all the traces to show up
curl -v http://localhost:16686/api/traces/$ID | jq .
if [ "$(curl -v http://localhost:16686/api/traces/$ID | grep -o "\"traceID\":\"$ID\"" | wc -l)" != "7" ] ; then
  finish 1 "Did not find the trace in Jaeger"
fi

echo "Bulk test of the jaeger proxy"
JAEGER_SERVICE_NAME=simple_jaeger_test_client \
  bazel run -- //tracing/client:test_client -port 10001 \
  -host localhost -expected_sr=0.7 -sr_threshold=0.3 -requests 10 || finish 1 "client failed"

sleep 5s
curl -f "http://localhost:16686/api/traces?limit=200&lookback=1h&service=simple_jaeger_test_client"
echo "Check for the jaeger span for the client"
curl -f "http://localhost:16686/api/traces?limit=200&lookback=1h&service=simple_jaeger_test_client" \
  | grep -o "traceID\":\"[0-9a-z]*\"" | sort | uniq -c || finish 1 "Failed finding bulk requests"


finish 0 "Test looks successful"
