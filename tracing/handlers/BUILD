
go_library(
    name = "common_handlers",
    srcs = ["common_handlers.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "common_handlers_test",
    srcs = ["common_handlers.go"],
    size = "small",
)

go_library(
    name = "tracing_handlers",
    srcs = ["tracing_handlers.go"],
    deps = [
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library"
        ],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
)
