#! /bin/sh

set -euo pipefail

finish() {
    echo "Stopping the server and returning $1"
    echo "Finish status: $2"
    ps ax | grep -v grep | grep run.*restapi | awk '{print $1}' | xargs kill
    exit $1
}

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

echo "Starting server"
bazel run //examples/scala/restapi:scala_rest &

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

echo "Simple test"
if [ "Hello unnamed" != "$(curl -s localhost:8080/hi)" ] ; then
  finish 1 "Simple test failed"
fi

echo "Param test"
if [ "Hello foo" != "$(curl -s localhost:8080/hi?name=foo)" ] ; then
  finish 1 "Param test failed"
fi


finish 0 "Test looks successful"