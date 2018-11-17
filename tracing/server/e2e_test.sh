#! /bin/bash

set -euo pipefail

PORT=18088

finish() {
    echo "Stopping Jaeger server"
    docker kill jaeger || true
    echo ""
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

echo "Starting all-in-one Jaeger server"
docker run --rm -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.7
sleep 5s

echo "Starting Flaky server"
JAEGER_SERVICE_NAME=e2e_testing \
  bazel run \
    -- //tracing/server:flaky -flakepct=0.25 -port $PORT -debug=true &

# Wait for the server to start
SUCCESS=false
for r in $(seq 3) ; do
   sleep 2s
   if curl -s localhost:$PORT/ | grep "flake" ; then
     SUCCESS=true
     break
   else
     echo "Server is not up yet"
   fi
done

if [ "$SUCCESS" = "false" ] ; then
  finish 1 "Server health check did not succeed quickly enough"
fi

echo "Check Flaky Percent"
successes=0
failures=0
for r in $(seq 100) ; do
  resp=$(curl -s localhost:$PORT | egrep -o '(false|true)' || echo FAIL )
  if [[ "$resp" == "true" ]] ; then
    successes=$((successes+1))
  elif [[ "$resp" == "false" ]] ; then
    failures=$((failures+1))
  else
    echo "Got a response of $resp"
    finish 1 "Got an unexpected response value"
  fi
done


total=$((successes + failures))
if [[ successes -lt 23 ]] ; then
  finish 1 "Got an unexpectedly low number of successes, but got $successes"
elif [[ failures -lt 72 ]] ; then
  finish 1 "Got an unexpectedly low number of failures, but got $failures"
elif [[ total -ne 100 ]] ; then
  finish 1 "Should have gotten exactly 100 responses, but got $total"
fi

echo "Validate that tracing is really working"
ID=$RANDOM
curl -H "Uber-Trace-Id: $ID:$ID:0:3" localhost:$PORT
sleep 1s
curl -v http://localhost:16686/api/traces/$ID | grep "\"traceID\":\"$ID\"" && FOUND=true || FOUND=false
if [[ $FOUND != true ]] ; then
  finish 1 "Did not find the trace in Jaeger"
fi

finish 0 "Test looks successful"
