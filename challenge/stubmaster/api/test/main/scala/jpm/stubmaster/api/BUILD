scala_test(
    name = "test",
    srcs = glob(["*.scala"]),
    size = "small",
    deps = [
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/api",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/repository",
        "//3rdparty/jvm/com/datastax/cassandra:cassandra_driver_core",
        "//3rdparty/jvm/com/typesafe/akka:akka_http_spray_json_2_11",
        "//3rdparty/jvm/com/typesafe/akka:akka_http_testkit_2_11",
    ],
)
