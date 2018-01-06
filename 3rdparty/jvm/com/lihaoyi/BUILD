load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "ammonite_2_11_11",
    exports = [
        "//3rdparty/jvm/com/github/scopt:scopt_2_11",
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//external:jar/com/lihaoyi/ammonite_2_11_11",
        ":ammonite_compiler_2_11_11",
        ":ammonite_ops_2_11",
        ":ammonite_repl_2_11_11",
        ":ammonite_runtime",
        ":ammonite_terminal_2_11",
        ":ammonite_util_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "ammonite_compiler_2_11_11",
    exports = [
        "//3rdparty/jvm/org/javassist:javassist",
        "//3rdparty/jvm/org/scala_lang:scala_compiler",
        "//3rdparty/jvm/org/scala_lang:scala_reflect",
        ":scalaparse_2_11"
    ],
    jars = [
        "//external:jar/com/lihaoyi/ammonite_compiler_2_11_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "ammonite_ops_2_11",
    exports = [
        "//external:jar/com/lihaoyi/ammonite_ops_2_11",
        ":geny_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "ammonite_repl_2_11_11",
    exports = [
        "//3rdparty/jvm/com/github/javaparser:javaparser_core",
        "//3rdparty/jvm/jline:jline",
        "//external:jar/com/lihaoyi/ammonite_repl_2_11_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "ammonite_runtime",
    exports = [
        "//3rdparty/jvm/io/get_coursier:coursier",
        "//3rdparty/jvm/io/get_coursier:coursier_cache_2_11",
        "//3rdparty/jvm/org/scalaj:scalaj_http_2_11"
    ],
    jars = [
        "//external:jar/com/lihaoyi/ammonite_runtime_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "ammonite_terminal_2_11",
    exports = [
        "//external:jar/com/lihaoyi/ammonite_terminal_2_11",
        ":fansi_2_11",
        ":sourcecode_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "ammonite_util_2_11",
    exports = [
        "//external:jar/com/lihaoyi/ammonite_util_2_11",
        ":pprint_2_11",
        ":upickle_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "derive_2_11",
    exports = [
        "//external:jar/com/lihaoyi/derive_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "fansi_2_11",
    exports = [
        "//external:jar/com/lihaoyi/fansi_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "fastparse_2_11",
    exports = [
        "//external:jar/com/lihaoyi/fastparse_2_11",
        ":fastparse_utils_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "fastparse_utils_2_11",
    exports = [
        "//external:jar/com/lihaoyi/fastparse_utils_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "geny_2_11",
    exports = [
        "//external:jar/com/lihaoyi/geny_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "pprint_2_11",
    exports = [
        "//external:jar/com/lihaoyi/pprint_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "scalaparse_2_11",
    exports = [
        "//external:jar/com/lihaoyi/scalaparse_2_11",
        ":fastparse_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "sourcecode_2_11",
    exports = [
        "//external:jar/com/lihaoyi/sourcecode_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "upickle_2_11",
    exports = [
        "//3rdparty/jvm/org/spire_math:jawn_parser_2_11",
        "//external:jar/com/lihaoyi/upickle_2_11",
        ":derive_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


