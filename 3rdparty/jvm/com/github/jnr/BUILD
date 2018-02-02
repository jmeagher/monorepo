load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "jffi",
    exports = [
        "//external:jar/com/github/jnr/jffi"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jnr_constants",
    exports = [
        "//external:jar/com/github/jnr/jnr_constants"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jnr_ffi",
    exports = [
        "//3rdparty/jvm/org/ow2/asm:asm",
        "//3rdparty/jvm/org/ow2/asm:asm_analysis",
        "//3rdparty/jvm/org/ow2/asm:asm_commons",
        "//3rdparty/jvm/org/ow2/asm:asm_tree",
        "//3rdparty/jvm/org/ow2/asm:asm_util",
        "//external:jar/com/github/jnr/jnr_ffi",
        ":jffi",
        ":jnr_x86asm"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jnr_posix",
    exports = [
        "//external:jar/com/github/jnr/jnr_posix",
        ":jnr_constants"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jnr_x86asm",
    exports = [
        "//external:jar/com/github/jnr/jnr_x86asm"
    ],
    visibility = [
        "//visibility:public"
    ]
)


