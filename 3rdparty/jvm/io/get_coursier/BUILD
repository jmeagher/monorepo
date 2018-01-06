load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "coursier",
    exports = [
        "//3rdparty/jvm/org/scala_lang/modules:scala_xml",
        "//3rdparty/jvm/org/scalaz:scalaz_core_2_11"
    ],
    jars = [
        "//external:jar/io/get_coursier/coursier_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "coursier_cache_2_11",
    exports = [
        "//3rdparty/jvm/org/scalaz:scalaz_concurrent_2_11",
        "//external:jar/io/get_coursier/coursier_cache_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


