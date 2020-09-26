load("@io_bazel_rules_go//go:def.bzl", "go_library", "go_test")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

go_library(
    name = "httphelpers",
    srcs = [
        "allow_methods.go",
        "cached_bodies.go",
        "common_handlers.go",
        "logger.go",
        "simple_retry.go",
        "structured_log.go",
    ],
    importpath = "github.com/jmeagher/monorepo/golang/httphelpers",
    visibility = ["//visibility:public"],
    deps = ["@com_github_sirupsen_logrus//:logrus"],
)

go_test(
    name = "httphelpers_test",
    size = "small",
    srcs = [
        "allow_methods_test.go",
        "cached_bodies_test.go",
        "common_handlers_test.go",
        "logger_test.go",
        "simple_retry_test.go",
        "structured_log_test.go",
    ],
    args = ["-test.v"],
    embed = [":httphelpers"],
    deps = [
        "@com_github_sirupsen_logrus//:logrus",
        "@com_github_sirupsen_logrus//hooks/test",
        "@com_github_stretchr_testify//assert",
    ],
)
