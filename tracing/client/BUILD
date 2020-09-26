load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_binary(
    name = "test_client",
    embed = [":client_lib"],
    visibility = ["//visibility:public"],
)

go_image(
    name = "test_client_image",
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
    name = "client_lib",
    srcs = ["test_client.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/client",
    visibility = ["//visibility:private"],
    deps = [
        "//tracing/jaeger",
        "@com_github_kelseyhightower_envconfig//:envconfig",
        "@com_github_opentracing_opentracing_go//:opentracing-go",
        "@com_github_opentracing_opentracing_go//ext",
    ],
)
