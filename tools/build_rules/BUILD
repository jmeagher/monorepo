
load("@io_bazel_rules_scala//scala:scala_toolchain.bzl", "scala_toolchain")

scala_toolchain(
    name = "strict_scala_toolchain_impl",
    scalacopts = [
        "-unchecked",
        "-deprecation",
        "-Xfuture",
        "-Xlint",
        "-Yno-adapted-args",
        "-Ywarn-dead-code",
        "-Ywarn-numeric-widen",
        "-Ywarn-value-discard",
        "-Ywarn-unused",
        "-Ywarn-unused-import",
        "-Ywarn-infer-any",
        "-Ywarn-inaccessible",
    ],
    visibility = ["//visibility:public"],
)

toolchain(
    name = "strict_scala_toolchain",
    toolchain_type = "@io_bazel_rules_scala//scala:toolchain_type",
    toolchain = "strict_scala_toolchain_impl",
    visibility = ["//visibility:public"],
)

filegroup(
    name = "srcs",
    srcs = [
        "prelude_bazel",
        "rules_loader.bzl",
    ],
)