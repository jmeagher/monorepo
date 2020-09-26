load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_binary(
    name = "flaky",
    embed = [":server_lib"],
    visibility = ["//visibility:public"],
)

go_image(
    name = "flaky_image",
    embed = [":go_default_library"],
    goarch = "amd64",
    goos = "linux",
    pure = "on",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "server_lib",
    srcs = ["flaky.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/server",
    visibility = ["//visibility:private"],
    deps = [
        "//golang/httphelpers",
        "//tracing/handlers",
        "//tracing/jaeger",
        "@com_github_kelseyhightower_envconfig//:envconfig",
    ],
)
