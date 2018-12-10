
go_binary(
    name = "flaky",
    srcs = ["flaky.go"],
    deps = [
        "@com_github_kelseyhightower_envconfig//:go_default_library",
        "//tracing/handlers:handlers",
        "//tracing/jaeger:jaeger_init",
    ],
)

go_image(
    name = "flaky_image",
    srcs = ["flaky.go"],
    deps = [
        "@com_github_kelseyhightower_envconfig//:go_default_library",
        "//tracing/handlers:handlers",
        "//tracing/jaeger:jaeger_init",
    ],
    goarch = "amd64",
    goos = "linux",
    pure = "on",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)