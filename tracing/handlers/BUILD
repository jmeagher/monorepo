load("@io_bazel_rules_go//go:def.bzl", "go_library")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "go_default_library",
    srcs = ["tracing_handlers.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
    deps = [
        "//golang/httphelpers:go_default_library",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library",
    ],
)
