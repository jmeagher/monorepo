load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")

scala_import(
    name = "akka_actor",
    exports = [
        "//3rdparty/jvm/com/typesafe:config",
        "//3rdparty/jvm/org/scala_lang/modules:scala_java8_compat",
        "//3rdparty/jvm/org/scala_lang:scala_library",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_actor_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)

java_library(
    name = "akka_http_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_2_11",
        ":akka_http_core",
    ],
    visibility = [
        "//visibility:public",
    ],
)

scala_import(
    name = "akka_http_core",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_parsing",
        ":akka_stream",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_http_core_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)

java_library(
    name = "akka_http_spray_json_2_11",
    exports = [
        "//3rdparty/jvm/io/spray:spray_json",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_spray_json_2_11",
        ":akka_http_2_11",
    ],
    visibility = [
        "//visibility:public",
    ],
)

java_library(
    name = "akka_http_testkit_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/typesafe/akka/akka_http_testkit_2_11",
        ":akka_http_2_11",
        ":akka_stream_testkit",
    ],
    visibility = [
        "//visibility:public",
    ],
)

scala_import(
    name = "akka_parsing",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_actor",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_parsing_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)

scala_import(
    name = "akka_stream",
    exports = [
        "//3rdparty/jvm/com/typesafe:ssl_config_core",
        "//3rdparty/jvm/org/reactivestreams:reactive_streams",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_actor",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_stream_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)

scala_import(
    name = "akka_stream_testkit",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_stream",
        ":akka_testkit",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_stream_testkit_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)

scala_import(
    name = "akka_testkit",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_actor",
    ],
    jars = [
        "//external:jar/com/typesafe/akka/akka_testkit_2_11",
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__",
    ],
)
