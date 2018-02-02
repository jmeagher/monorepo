load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "cassandra_driver_core",
    exports = [
        "//3rdparty/jvm/com/github/jnr:jnr_ffi",
        "//3rdparty/jvm/com/github/jnr:jnr_posix",
        "//3rdparty/jvm/com/google/guava:guava",
        "//3rdparty/jvm/io/dropwizard/metrics:metrics_core",
        "//3rdparty/jvm/io/netty:netty_handler",
        "//3rdparty/jvm/org/slf4j:slf4j_api",
        "//external:jar/com/datastax/cassandra/cassandra_driver_core"
    ],
    visibility = [
        "//visibility:public"
    ]
)


