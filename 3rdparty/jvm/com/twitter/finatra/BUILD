load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "finatra_http_2_11",
    exports = [
        "//external:jar/com/twitter/finatra/finatra_http_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/github/spullara/mustache/java:compiler",
        "//3rdparty/jvm/com/twitter/inject:inject_request_scope_2_11",
        "//3rdparty/jvm/com/twitter/inject:inject_server",
        "//3rdparty/jvm/commons_fileupload:commons_fileupload",
        "//3rdparty/jvm/javax/servlet:servlet_api",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":finatra_jackson",
        ":finatra_slf4j_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "finatra_jackson",
    jars = [
        "//external:jar/com/twitter/finatra/finatra_jackson_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson_datatype_joda",
        "//3rdparty/jvm/com/fasterxml/jackson/module:jackson_module_scala",
        "//3rdparty/jvm/org/scala_lang:scalap",
        ":finatra_scalap_compiler_deps_2_11",
        ":finatra_utils"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finatra_scalap_compiler_deps_2_11",
    exports = [
        "//external:jar/com/twitter/finatra/finatra_scalap_compiler_deps_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "finatra_slf4j_2_11",
    exports = [
        "//external:jar/com/twitter/finatra/finatra_slf4j_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/twitter:finagle_http_2_11",
        "//3rdparty/jvm/org/slf4j:jcl_over_slf4j",
        "//3rdparty/jvm/org/slf4j:jul_to_slf4j",
        "//3rdparty/jvm/org/slf4j:log4j_over_slf4j"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "finatra_utils",
    jars = [
        "//external:jar/com/twitter/finatra/finatra_utils_2_11"
    ],
    runtime_deps = [
        "//3rdparty/jvm/com/github/nscala_time:nscala_time_2_11",
        "//3rdparty/jvm/com/google/inject:guice",
        "//3rdparty/jvm/com/twitter:util_core",
        "//3rdparty/jvm/joda_time:joda_time",
        "//3rdparty/jvm/org/apache/thrift:libthrift"
    ],
    visibility = [
        "//visibility:public"
    ]
)


