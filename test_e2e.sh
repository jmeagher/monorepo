#! /bin/bash

set -euo pipefail

BASE=${1:-.}

for T in $(find $BASE -name "e2e_test*.sh") ; do
  echo ""
  echo ""
  echo "**************************************************"
  echo ""
  echo "Running $T"
  echo ""
  $T || exit 1
done
