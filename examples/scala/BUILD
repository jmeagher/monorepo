scala_library(
    name = "jpm-lib",
    srcs = glob(["src/*.scala"]),
    visibility = ["//visibility:public"]
)

scala_test(
  name = "test",
  srcs = glob(["src/test/*.scala"]),
  deps = ["jpm-lib"]
)

