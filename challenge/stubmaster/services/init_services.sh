set -euo pipefail

CONTAINER=monorepo-test-cassandra

if docker container ls -a | grep $CONTAINER ; then
  echo "The cassandra container is already running."
  echo "It should be killed before running this init."
  echo "Shut it down with: docker kill $CONTAINER ; docker container rm $CONTAINER"
  # exit 1
  docker kill $CONTAINER || echo "kill"
  docker container rm $CONTAINER
fi

bazel run //challenge/stubmaster/services:stubmaster_cassandra \
&& docker run -d --name $CONTAINER -p 9042:9042 -p 9160:9160 \
  bazel/challenge/stubmaster/services:stubmaster_cassandra

# Wait to confirm cassandra is really started
while true ; do
  if docker exec $CONTAINER cqlsh -e 'describe schema' | grep -i stubmaster ; then
    break
  else
    echo "It looks like things aren't started yet, sleeping a little"
    sleep 2s
  fi
done

# To make sure it's really setup and running
sleep 2s

# Final validation that everything is ok
docker exec $CONTAINER grep "Finished running the cassandra-init scripts" /cassandra_init.log \
  && echo "Everything looks good" \
  || echo "It looks like the init script may have failed"
