package(default_visibility = ["//visibility:public"])

py_library(
    name = "jpm",
    srcs = ["jpmlib.py", "__init__.py"],
    imports = [".."], # This anchors the modules root to be the top level simple folder
    # I think the location version should be used instead, but it doesn't work for me
    # imports = ["$(location //examples/python/simple)"],
)

py_test(
    name = "jpm_test",
    srcs = ["test/jpm_test.py"],
    deps = [":jpm"],
    size = "small",
)
