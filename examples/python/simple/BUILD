py_binary(
    name = "main",
    srcs = ["main.py"],
    deps = ["//examples/python/simple/jpm:jpm"],
)

py_image(
    name = "main_docker",
    srcs = ["main.py"],
    deps = [":main"],
    main = "main.py",
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)
