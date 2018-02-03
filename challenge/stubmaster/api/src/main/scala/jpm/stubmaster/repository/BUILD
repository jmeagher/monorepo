scala_library(
    name = "repository",
    srcs = glob(["*.scala"]),
    visibility = ["//visibility:public"],
    deps = [
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "//3rdparty/jvm/com/datastax/cassandra:cassandra_driver_core",
        "//3rdparty/jvm/com/typesafe/akka:akka_http_2_11",
    ],
)
