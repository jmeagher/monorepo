load("//tracing/envoyproxy:envoy.bzl", "envoy_config")

# Very simple example pretty much copied from the getting started guide
envoy_config("google_proxy", "google_proxy.yaml")

envoy_config("simple_retry_proxy", "simple_retry_proxy.yaml", "debug")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)