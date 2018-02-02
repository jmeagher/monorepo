#! /bin/bash

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    ps ax | grep -v grep | grep run.*stubmaster_api | awk '{print $1}' | xargs kill
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

echo "Starting server"
bazel run //challenge/stubmaster/api:stubmaster_api &

# Wait for the server to start
SUCCESS=false
for R in $(seq 10) ; do
   sleep 5s
   if curl -s localhost:8080/ | grep "Hello World" ; then
     SUCCESS=true
     break
   else
     echo "Server is not up yet"
   fi
done

if [ "$SUCCESS" = "false" ] ; then
  finish 1 "Server health check did not succeed quickly enough"
fi

echo "Venue test"
if [ "[]" != "$(curl -s localhost:8080/venue)" ] ; then
  finish 1 "Venue test failed"
fi

finish 0 "Test looks successful"