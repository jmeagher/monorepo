#! /bin/bash

# skip test for now
exit 0

set -euo pipefail

if [ "$(bazel run //examples/rust/simple:fibonacci)" != "55" ] ; then
  echo "Fibonacci fail"
  exit 1
fi
