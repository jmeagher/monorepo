
go_library(
    name = "httphelpers",
    srcs = [
        "cached_bodies.go",
        "common_handlers.go",
        "simple_retry.go",
    ],
    deps = [
        # "@com_github_opentracing_opentracing_go//:go_default_library",
        # "@com_github_opentracing_opentracing_go//ext:go_default_library"
        ],
    importpath = "github.com/jmeagher/monorepo/golang/httphelpers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "httphelpers_test",
    srcs = [
        "cached_bodies.go", "cached_bodies_test.go",
        "common_handlers.go", "common_handlers_test.go",
        "simple_retry.go", "simple_retry_test.go",
        ],
    deps = [":httphelpers"],
    args = ["-test.v"],
    size = "small",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)