load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "inject_app_2_11",
    exports = [
        "//external:jar/com/twitter/inject/inject_app_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "inject_core_2_11",
    exports = [
        "//external:jar/com/twitter/inject/inject_core_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/google/inject/extensions:guice_assistedinject",
        "//3rdparty/jvm/com/google/inject/extensions:guice_multibindings",
        "//3rdparty/jvm/com/twitter:util_app_2_11",
        "//3rdparty/jvm/javax/inject:javax_inject",
        "//3rdparty/jvm/net/codingwell:scala_guice_2_11",
        "//3rdparty/jvm/org/clapper:grizzled_slf4j_2_11",
        "//3rdparty/jvm/org/joda:joda_convert"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "inject_modules_2_11",
    exports = [
        "//external:jar/com/twitter/inject/inject_modules_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "inject_request_scope_2_11",
    exports = [
        "//external:jar/com/twitter/inject/inject_request_scope_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/twitter:finagle_core_2_11",
        ":inject_core_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "inject_server",
    jars = [
        "//external:jar/com/twitter/inject/inject_server_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/twitter:finagle_stats_2_11",
        "//3rdparty/jvm/com/twitter:twitter_server",
        ":inject_app_2_11",
        ":inject_modules_2_11",
        ":inject_utils_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "inject_utils_2_11",
    exports = [
        "//external:jar/com/twitter/inject/inject_utils_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/commons_lang:commons_lang"
    ],
    visibility = [
        "//visibility:public"
    ]
)


