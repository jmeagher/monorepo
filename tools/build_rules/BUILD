load("@io_bazel_rules_scala//scala:scala_toolchain.bzl", "scala_toolchain")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/jmeagher/monorepo
gazelle(name = "gazelle")
