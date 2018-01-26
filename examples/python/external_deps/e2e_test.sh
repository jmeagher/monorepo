#! /bin/bash
set -euo pipefail

do_test() {
    echo "Test $@"
    if [ "$($@)" != "50.0" ] ; then
        echo "Failed when testing $@"
        exit 1
    fi
}

do_test bazel run //examples/python/external_deps:main
do_test ./bazel-bin/examples/python/external_deps/main
