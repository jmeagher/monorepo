load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
scala_import(
    name = "jackson_module_scala",
    exports = [
        "//3rdparty/jvm/com/google/code/findbugs:jsr305",
        "//3rdparty/jvm/com/thoughtworks/paranamer:paranamer",
        "//3rdparty/jvm/org/scala_lang:scala_reflect"
    ],
    jars = [
        "//external:jar/com/fasterxml/jackson/module/jackson_module_scala_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


