filegroup(
    name = "sources",
    srcs = [
        "common_handlers.go",
    ],
)

go_library(
    name = "handlers",
    srcs = [":sources"],
    importpath = "github.com/jmeagher/monorepo/tracing/handlers",
    visibility = ["//visibility:public"],
)

go_test(
    name = "handlers_test",
    srcs = [":sources"],
    size = "small",
)
