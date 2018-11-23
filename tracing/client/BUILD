
go_binary(
    name = "test_client",
    srcs = ["test_client.go"],
    deps = [
        "//tracing/jaeger:jaeger_init",
        "//tracing/handlers:handlers",
        "@com_github_opentracing_opentracing_go//:go_default_library",
        "@com_github_opentracing_opentracing_go//ext:go_default_library",
    ],
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)