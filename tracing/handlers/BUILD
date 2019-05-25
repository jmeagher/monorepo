
go_library(
    name = "handlers",
    srcs = [
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

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)