scala_binary(
    name = "scala_rest",
    main_class = "jpm.restapi.RestServerMain",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/restapi/src/main/scala/jpm/restapi",
    ],
    resources = [
        "application.conf",
    ],
    resource_strip_prefix = "examples/scala/restapi",
)

scala_repl(
    name = "repl",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/restapi/src/main/scala/jpm/restapi",
    ],
)

scala_image(
    name = "tmp",
    deps = [
        ":scala_rest",
    ],
    main_class = "jpm.restapi.RestServerMain",
)

container_image(
    name = "image",
    base = ":tmp",
    ports = [
        "8080",
    ],
)

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)
