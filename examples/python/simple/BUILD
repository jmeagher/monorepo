
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

container_test(
    name = "main_test",
    configs = [":docker_validation_test.yaml"],
    image = ":main_docker",
    size = "small",
)