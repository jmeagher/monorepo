load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

go_library(
    name = "httphelpers",
    srcs = [
        "cached_bodies.go",
        "common_handlers.go",
        "simple_retry.go",
    ],
    importpath = "github.com/jmeagher/monorepo/golang/httphelpers",
    visibility = ["//visibility:public"],
    deps = [
        # "@com_github_opentracing_opentracing_go//:go_default_library",
        # "@com_github_opentracing_opentracing_go//ext:go_default_library"
    ],
)

go_test(
    name = "httphelpers_test",
    size = "small",
    srcs = [
        "cached_bodies.go",
        "cached_bodies_test.go",
        "common_handlers.go",
        "common_handlers_test.go",
        "simple_retry.go",
        "simple_retry_test.go",
    ],
    args = ["-test.v"],
    deps = [":httphelpers"],
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "go_default_library",
    srcs = [
        "cached_bodies.go",
        "common_handlers.go",
        "simple_retry.go",
    ],
    importpath = "github.com/jmeagher/monorepo/golang/httphelpers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "go_default_test",
    srcs = [
        "cached_bodies_test.go",
        "common_handlers_test.go",
        "simple_retry_test.go",
    ],
    embed = [":go_default_library"],
)
