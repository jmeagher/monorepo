#! /bin/bash
set -euo pipefail
bash /cassandra_init.sh &

exec ./docker-entrypoint.sh "$@"