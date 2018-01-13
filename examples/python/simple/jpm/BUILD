package(default_visibility = ["//visibility:public"])

py_library(
    name = "jpm",
    srcs = ["jpm.py", "__init__.py"],
)

py_test(
    name = "jpm_test",
    srcs = ["jpm_test.py", "__init__.py"],
    deps = [":jpm"],
    size = "small",
)
