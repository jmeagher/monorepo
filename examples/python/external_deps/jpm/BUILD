package(default_visibility = ["//visibility:public"])

py_library(
    name = "numerics",
    srcs = [
        "numerics.py",
        "__init__.py",
    ],
    deps = [
        requirement("numpy"),
        requirement("pandas"),
        requirement("pytz"),
        requirement("python-dateutil"),
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
