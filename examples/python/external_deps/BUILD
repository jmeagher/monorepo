
py_binary(
    name = "main",
    srcs = ["main.py"],
    deps = ["//examples/python/external_deps/jpm:numerics"],
)

py_image(
    name = "main_docker",
    srcs = ["main.py"],
    deps = [":main"],
    main = "main.py",
)
