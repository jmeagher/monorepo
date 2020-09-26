package(default_visibility = ["//visibility:public"])

py_library(
    name = "jpm",
    srcs = [
        "__init__.py",
        "jpmlib.py",
    ],
    imports = [".."],  # This anchors the modules root to be the top level simple folder
    # I think the location version should be used instead, but it doesn't work for me
    # imports = ["$(location //examples/python/simple)"],
)

py_test(
    name = "jpm_test",
    size = "small",
    srcs = ["test/jpm_test.py"],
    deps = [":jpm"],
)
