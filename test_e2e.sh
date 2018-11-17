#! /bin/bash

set -euo pipefail

for T in $(find . -name "e2e_test*.sh") ; do
  echo "Running $T"
  $T || exit 1
done
