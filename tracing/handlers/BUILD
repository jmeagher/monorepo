load("@io_bazel_rules_go//go:def.bzl", "go_library")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "handlers",
    srcs = ["tracing_handlers.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
    deps = [
        "//golang/httphelpers",
        "@com_github_opentracing_opentracing_go//:opentracing-go",
        "@com_github_opentracing_opentracing_go//ext",
    ],
)
