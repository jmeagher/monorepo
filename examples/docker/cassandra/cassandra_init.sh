#! /bin/bash
exec > >(tee -i /cassandra_init.log)
exec 2>&1

set -xeuo pipefail
if ls /*.cql ; then
  for F in /*.cql ; do
    touch $F.to_run
  done

  while ls /*.cql.to_run ; do
    echo "Sleeping a little"
    sleep 2s
    for F in /*.cql.to_run ; do
      echo "Trying to run $F"
      cql="${F%.*}"
      if cqlsh -f $cql ; then
        echo "Successfully ran $cql"
        rm $F
      else
        echo "Got an error running $cql will try again soon"
      fi
    done
  done

else
  echo "No cql files in / to run so doing nothing"
fi

echo "Finished running the cassandra-init scripts"
