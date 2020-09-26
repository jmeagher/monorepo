package(default_visibility = ["//visibility:public"])

py_library(
    name = "py",
    srcs = ["watercatching.py"],
)

py_test(
    name = "watercatchingtest",
    size = "small",
    srcs = ["watercatchingtest.py"],
    deps = [":py"],
)
