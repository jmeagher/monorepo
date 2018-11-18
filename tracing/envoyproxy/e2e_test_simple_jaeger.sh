#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    docker kill simple_jaeger || true
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

bazel run //tracing/envoyproxy:simple_jaeger \
 && docker run --rm -d --name simple_jaeger -p 9090:10000 \
    bazel/tracing/envoyproxy:simple_jaeger || finish 1 "Docker run failed"
sleep 3s
echo "Simple test of the basic jaeger proxy"
curl localhost:9090 || finish 1 "Query failed"

finish 0 "Test looks successful"