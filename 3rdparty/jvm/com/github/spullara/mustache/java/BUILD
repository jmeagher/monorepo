load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "compiler",
    exports = [
        "//external:jar/com/github/spullara/mustache/java/compiler"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/google/guava:guava"
    ],
    visibility = [
        "//visibility:public"
    ]
)


