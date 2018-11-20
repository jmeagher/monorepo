#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    docker kill google_proxy || true
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

bazel run //tracing/envoyproxy:google_proxy \
 && docker run --rm --name google_proxy -p 10000:10000 \
    bazel/tracing/envoyproxy:google_proxy &

while ! nc -z localhost 10000; do
  sleep 0.1
done
sleep 2s

echo "Simple test of the google proxy"
curl localhost:10000 | \
  grep 'Google has many special features' > /dev/null \
  || finish 1 "Google Test Failure"

finish 0 "Test looks successful"