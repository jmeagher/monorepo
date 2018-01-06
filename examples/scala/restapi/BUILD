scala_binary(
    name = "scala_rest",
    main_class = "jpm.restapi.RestServerMain",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/restapi/src/main/scala/jpm/restapi",
    ]
)

# Note: This doesn't work when run with "bazel run".
# To execute it use "bazel build" and run the binary from bazel-bin.
# Hopefully the need for this will go away with https://github.com/bazelbuild/bazel/issues/1394
scala_binary(
    name = "repl",
    main_class = "ammonite.Main",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/restapi/src/main/scala/jpm/restapi",
        "@com_lihaoyi_ammonite_2_11_11//jar",
        "@scala//:scala-compiler",
        "@scala//:scala-xml",
    ]
)