scala_library(
    name = "api",
    srcs = glob(["*.scala"]),
    visibility = ["//visibility:public"],
    deps = [
        "//3rdparty/jvm/com/datastax/cassandra:cassandra_driver_core",
        "//3rdparty/jvm/com/typesafe/akka:akka_http_2_11",
        "//3rdparty/jvm/com/typesafe/akka:akka_http_spray_json_2_11",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/repository",
    ],
)
