
go_library(
    name = "jaeger_init",
    srcs = ["jaeger_init.go"],
    importpath = "github.com/jmeagher/monorepo/tracing/jaeger",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_uber_jaeger_client_go//config:go_default_library",
    ],
)

go_binary(
    name = "test_client",
    srcs = ["test_client.go"],
    deps = [
        ":jaeger_init",
        "//tracing/handlers:handlers",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library",
    ],
)