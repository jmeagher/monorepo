package(default_visibility = ["//visibility:public"])

py_library(
    name = "numerics",
    srcs = [
        "numerics.py",
        "__init__.py",
    ],
    deps = [
        requirement("pandas"),
        requirement("six"),
    ],
    imports = [".."],
)

py_test(
    name = "numerics_test",
    srcs = ["test/numerics_test.py"],
    deps = [":numerics"],
    size = "small",
)
