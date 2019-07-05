scala_test(
    name = "test",
    srcs = glob(["*.scala"]),
    size = "small",
    deps = [
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/api",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/model",
        "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/repository",
        "@maven//:com_datastax_cassandra_cassandra_driver_core",
        "@maven//:com_typesafe_akka_akka_http_spray_json_2_11",
        "@maven//:com_typesafe_akka_akka_http_testkit_2_11",
    ],
)
