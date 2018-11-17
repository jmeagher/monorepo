
go_binary(
    name = "flaky",
    srcs = ["flaky.go"],
    deps = [
        "//tracing/handlers:handlers",
        "//tracing/jaeger:jaeger_init",
    ],
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)