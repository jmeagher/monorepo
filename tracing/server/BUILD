load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

go_binary(
    name = "flaky",
    embed = [":go_default_library"],
    visibility = ["//visibility:public"],
)

go_image(
    name = "flaky_image",
    srcs = ["flaky.go"],
    deps = [
        "@com_github_kelseyhightower_envconfig//:go_default_library",
        "//golang/httphelpers:httphelpers",
        "//tracing/handlers:handlers",
        "//tracing/jaeger:jaeger_init",
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
    srcs = ["flaky.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/server",
    visibility = ["//visibility:private"],
    deps = ["@com_github_kelseyhightower_envconfig//:go_default_library"],
)
