load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "scala_java8_compat",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library"
    ],
    jars = [
        "//external:jar/org/scala_lang/modules/scala_java8_compat_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scala_parser_combinators",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library"
    ],
    jars = [
        "//external:jar/org/scala_lang/modules/scala_parser_combinators_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_library(
    name = "scala_xml",
    exports = [
        "//external:io_bazel_rules_scala/dependency/scala/scala_xml"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


