#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    docker kill simple_retry_proxy || true
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill || true
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

echo "Starting proxy"
bazel run //tracing/envoyproxy:simple_retry_proxy \
 && docker run --rm --name simple_retry_proxy -p 10000:10000 \
    -e SERVICE_HOST=$SERVICE_HOST -e SERVICE_PORT=10001 \
    bazel/tracing/envoyproxy:simple_retry_proxy &

echo "Starting Flaky server"
JAEGER_SERVICE_NAME=e2e_retry_server \
  bazel run \
    -- //tracing/server:flaky --success_rate=0.29 -port 10001 -error_code 500 &

echo Wait for startup of servers
while ! curl -s localhost:10001 > /dev/null ; do
  sleep 0.1
done
while ! curl -s localhost:10000 > /dev/null ; do
  sleep 0.1
done
sleep 1s

echo "Check SR when querying through the proxy"
JAEGER_SERVICE_NAME=e2e_retry_client \
  bazel run \
    -- //tracing/client:test_client -host=localhost -port 10000 \
    -expected_sr=0.5 -sr_threshold=0.02 -requests=300 \
    || finish 1 "Success rate failure"

finish 0 "Test looks successful"
