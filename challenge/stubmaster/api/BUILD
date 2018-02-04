scala_binary(
  name = "stubmaster_api",
  main_class = "jpm.stubmaster.api.ApiServerMain",
  visibility = ["//visibility:public"],
  deps = [
    "//3rdparty/jvm/io/netty:netty_all",
    "//challenge/stubmaster/api/src/main/scala/jpm/stubmaster/api",
  ],
  resources = [
      "application.conf"
  ],
  resource_strip_prefix = "challenge/stubmaster/api",
)

scala_image(
  name = "tmp",
  deps = [
    ":stubmaster_api"
  ],
  main_class = "jpm.stubmaster.api.ApiServerMain",
)

container_image(
    name = "image",
    base = ":tmp",
    ports = [
        "8080",
    ],
)
