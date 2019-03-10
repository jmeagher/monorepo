load("//tracing/envoyproxy:envoy.bzl", "envoy_config")

# Very simple example pretty much copied from the getting started guide
envoy_config("google_proxy", "google_proxy.yaml")

envoy_config("simple_retry_proxy", "simple_retry_proxy.yaml")

# Front a single service instance and add Jaeger logging
envoy_config("simple_jaeger", "simple_jaeger.yaml") #, "debug")

envoy_config("priority_with_failover", "priority_with_failover_proxy.yaml", "debug")

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)
