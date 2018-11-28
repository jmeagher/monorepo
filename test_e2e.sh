#! /bin/bash

set -euo pipefail

BASE=${1:-.}

for T in $(find $BASE -name "e2e_test*.sh") ; do
  echo "Running $T"
  $T || exit 1
done
