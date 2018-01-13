package(default_visibility = ["//visibility:public"])

py_library(
    name = "jpm",
    srcs = ["jpmlib.py", "__init__.py"],
    imports = [".."],
)

py_test(
    name = "jpm_test",
    srcs = ["test/jpm_test.py"],
    deps = [":jpm"],
    size = "small",
)
