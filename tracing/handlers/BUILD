
go_library(
    name = "handlers",
    srcs = [
        "common_handlers.go",
        "tracing_handlers.go",
    ],
    deps = [
        "//golang/httphelpers:httphelpers",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library"
        ],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "common_handlers_test",
    srcs = ["common_handlers.go", "common_handlers_test.go"],
    deps = [":handlers"],
    size = "small",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)