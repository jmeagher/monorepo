load("@io_bazel_rules_go//go:def.bzl", "go_library")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "jaeger",
    srcs = ["jaeger_init.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/jaeger",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_opentracing_opentracing_go//:opentracing-go",
        "@com_github_uber_jaeger_client_go//config",
        "@com_github_uber_jaeger_client_go//log",
    ],
)
