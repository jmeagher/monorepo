py_binary(
    name = "main",
    srcs = ["main.py"],
    deps = ["//examples/python/simple/jpm"],
)

py_image(
    name = "main_docker",
    srcs = ["main.py"],
    main = "main.py",
    deps = [":main"],
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)
