load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "akka_actor_2_11",
    exports = [
        "//3rdparty/jvm/com/typesafe:config",
        "//3rdparty/jvm/org/scala_lang/modules:scala_java8_compat_2_11",
        "//external:jar/com/typesafe/akka/akka_actor_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_http_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_2_11",
        ":akka_http_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_http_core_2_11",
    exports = [
        "//external:jar/com/typesafe/akka/akka_http_core_2_11",
        ":akka_parsing_2_11",
        ":akka_stream_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_http_spray_json_2_11",
    exports = [
        "//3rdparty/jvm/io/spray:spray_json_2_11",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_spray_json_2_11",
        ":akka_http_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_http_testkit_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_testkit_2_11",
        ":akka_http_2_11",
        ":akka_stream_testkit_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_parsing_2_11",
    exports = [
        "//external:jar/com/typesafe/akka/akka_parsing_2_11",
        ":akka_actor_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_stream_2_11",
    exports = [
        "//3rdparty/jvm/com/typesafe:ssl_config_core_2_11",
        "//3rdparty/jvm/org/reactivestreams:reactive_streams",
        "//external:jar/com/typesafe/akka/akka_stream_2_11",
        ":akka_actor_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_stream_testkit_2_11",
    exports = [
        "//external:jar/com/typesafe/akka/akka_stream_testkit_2_11",
        ":akka_stream_2_11",
        ":akka_testkit_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "akka_testkit_2_11",
    exports = [
        "//external:jar/com/typesafe/akka/akka_testkit_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


