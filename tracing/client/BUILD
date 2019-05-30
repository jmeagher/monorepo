load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_binary(
    name = "test_client",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

go_image(
    name = "test_client_image",
    srcs = ["test_client.go"],
    deps = [
        "//tracing/jaeger:jaeger_init",
        "//tracing/handlers:handlers",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library",
        "@com_github_kelseyhightower_envconfig//:go_default_library",
    ],
    goarch = "amd64",
    goos = "linux",
    pure = "on",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "go_default_library",
    srcs = ["test_client.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/client",
    visibility = ["//visibility:private"],
    deps = [
        "@com_github_kelseyhightower_envconfig//:go_default_library",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library",
    ],
)
