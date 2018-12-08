#! /bin/bash

set -euo pipefail

source tracing/common_stuff.sh

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

docker run jwilder/dockerize \
  -wait http://$SERVICE_HOST:10000 \
  -timeout 20s || finish 1 "Servers appear to not be started"


echo "Simple test of the google proxy"
curl localhost:10000 | \
  grep 'Google has many special features' > /dev/null \
  || finish 1 "Google Test Failure"

finish 0 "Test looks successful"