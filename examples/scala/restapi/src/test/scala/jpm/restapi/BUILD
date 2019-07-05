scala_test(
    name = "test",
    srcs = glob(["*.scala"]),
    size = "small",
    deps = [
        "//examples/scala/restapi/src/main/scala/jpm/restapi",
        "@maven//:com_typesafe_akka_akka_http_spray_json_2_11",
        "@maven//:com_typesafe_akka_akka_http_testkit_2_11",
    ],
)
