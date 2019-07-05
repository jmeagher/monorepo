scala_library(
    name = "api",
    srcs = glob(["*.scala"]),
    visibility = ["//visibility:public"],
    deps = [
        "@maven//:com_datastax_cassandra_cassandra_driver_core",
        "@maven//:com_typesafe_akka_akka_http_2_11",
        "@maven//:com_typesafe_akka_akka_http_spray_json_2_11",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/repository",
    ],
)
