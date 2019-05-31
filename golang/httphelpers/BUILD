load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "go_default_library",
    srcs = [
        "cached_bodies.go",
        "common_handlers.go",
        "logger.go",
        "simple_retry.go",
    ],
    importpath = "github.com/jmeagher/monorepo/golang/httphelpers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "go_default_test",
    size = "small",
    srcs = [
        "cached_bodies_test.go",
        "common_handlers_test.go",
        "logger_test.go",
        "simple_retry_test.go",
    ],
    args = ["-test.v"],
    embed = [":go_default_library"],
)
