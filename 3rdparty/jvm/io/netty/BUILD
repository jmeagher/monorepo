load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "netty_buffer",
    exports = [
        "//external:jar/io/netty/netty_buffer"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "netty_codec",
    exports = [
        "//external:jar/io/netty/netty_codec"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "netty_handler",
    exports = [
        "//external:jar/io/netty/netty_handler",
        ":netty_buffer",
        ":netty_codec",
        ":netty_transport"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "netty_transport",
    exports = [
        "//external:jar/io/netty/netty_transport"
    ],
    visibility = [
        "//visibility:public"
    ]
)


