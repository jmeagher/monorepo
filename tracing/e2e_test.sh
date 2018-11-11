#! /bin/bash

set -euo pipefail

PORT=18088

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    ps ax | grep -v grep | grep flaky | awk '{print $1}' | xargs kill
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

echo "Starting Flaky server"
bazel run -- //tracing:flaky --flakepct=0.25 --port $PORT &

# Wait for the server to start
SUCCESS=false
for r in $(seq 10) ; do
   sleep 5s
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

finish 0 "Test looks successful"