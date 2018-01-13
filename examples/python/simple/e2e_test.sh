#! /bin/sh
set -euo pipefail

do_test() {
    echo "Test $@"
    if [ "$($@)" != 1 ] ; then
        echo "Failed when testing $@"
        exit 1
    fi
}

do_test bazel run //examples/python/simple:main
do_test ./bazel-bin/examples/python/simple/main
