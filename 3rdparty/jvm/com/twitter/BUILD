load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "finagle_core_2_11",
    exports = [
        "//3rdparty/jvm/commons_codec:commons_codec",
        "//3rdparty/jvm/io/netty:netty",
        "//external:jar/com/twitter/finagle_core_2_11",
        ":jsr166e",
        ":util_cache_2_11",
        ":util_codec_2_11",
        ":util_collection_2_11",
        ":util_hashing_2_11",
        ":util_jvm_2_11",
        ":util_lint_2_11",
        ":util_logging_2_11",
        ":util_registry_2_11",
        ":util_stats_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finagle_http_2_11",
    exports = [
        "//external:jar/com/twitter/finagle_http_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finagle_stats_2_11",
    exports = [
        "//3rdparty/jvm/com/twitter/common:metrics",
        "//external:jar/com/twitter/finagle_stats_2_11",
        ":util_events_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finagle_thrift_2_11",
    exports = [
        "//external:jar/com/twitter/finagle_thrift_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finagle_zipkin_2_11",
    exports = [
        "//external:jar/com/twitter/finagle_zipkin_2_11",
        ":finagle_thrift_2_11",
        ":scrooge_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jsr166e",
    exports = [
        "//external:jar/com/twitter/jsr166e"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "scrooge_core_2_11",
    exports = [
        "//external:jar/com/twitter/scrooge_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "twitter_server",
    exports = [
        "//3rdparty/jvm/org/scala_lang/modules:scala_xml",
        ":finagle_zipkin_2_11"
    ],
    jars = [
        "//external:jar/com/twitter/twitter_server_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_app_2_11",
    exports = [
        "//external:jar/com/twitter/util_app_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_cache_2_11",
    exports = [
        "//external:jar/com/twitter/util_cache_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_codec_2_11",
    exports = [
        "//external:jar/com/twitter/util_codec_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_collection_2_11",
    exports = [
        "//3rdparty/jvm/commons_collections:commons_collections",
        "//external:jar/com/twitter/util_collection_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "util_core",
    exports = [
        "//3rdparty/jvm/org/scala_lang/modules:scala_parser_combinators",
        ":util_function_2_11"
    ],
    jars = [
        "//external:jar/com/twitter/util_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_events_2_11",
    exports = [
        "//external:jar/com/twitter/util_events_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_function_2_11",
    exports = [
        "//external:jar/com/twitter/util_function_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_hashing_2_11",
    exports = [
        "//external:jar/com/twitter/util_hashing_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_jvm_2_11",
    exports = [
        "//external:jar/com/twitter/util_jvm_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_lint_2_11",
    exports = [
        "//external:jar/com/twitter/util_lint_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_logging_2_11",
    exports = [
        "//external:jar/com/twitter/util_logging_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_registry_2_11",
    exports = [
        "//external:jar/com/twitter/util_registry_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_stats_2_11",
    exports = [
        "//external:jar/com/twitter/util_stats_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


