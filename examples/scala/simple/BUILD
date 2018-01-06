scala_binary(
    name = "jpm_simple_scala",
    main_class = "jpm.Jpm",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/simple/src/main/scala/jpm",
    ]
)

scala_binary(
    name = "simple_scala",
    main_class = "simple.Simple",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/simple/src/main/scala/simple",
    ]
)

scala_repl(
    name = "repl",
    visibility = ["//visibility:public"],
    deps = [
        "//examples/scala/simple/src/main/scala/jpm",
    ]
)