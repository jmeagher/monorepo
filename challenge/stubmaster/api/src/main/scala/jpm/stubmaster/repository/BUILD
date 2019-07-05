scala_library(
    name = "repository",
    srcs = glob(["*.scala"]),
    visibility = ["//visibility:public"],
    deps = [
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "@maven//:com_datastax_cassandra_cassandra_driver_core",
        "@maven//:com_typesafe_akka_akka_http_2_11",
    ],
)
