scala_binary(
    name = "jpm_simple_scala",
    main_class = "jpm.Jpm",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/simple/src/main/scala/jpm",
    ]
)

scala_binary(
    name = "simple_scala",
    main_class = "simple.Simple",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/simple/src/main/scala/simple",
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
        "//examples/scala/simple/src/main/scala/jpm",
        "@com_lihaoyi_ammonite_2_11_11//jar",
        "@scala//:scala-compiler",
        "@scala//:scala-xml",
    ]
)