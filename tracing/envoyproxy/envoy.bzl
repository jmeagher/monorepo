load("@io_bazel_rules_docker//container:container.bzl",
     "container_image",
     )

def envoy_config(name, file, log_level="info"):
    container_image(
        name = name,
        base = "@envoyproxy//image",
        files = [file, "start_proxy.sh"],
        # This is fairly delicate, it's copied from https://github.com/envoyproxy/envoy/blob/master/ci/Dockerfile-envoy-image
        cmd = "/start_proxy.sh %s %s %s" % (name, file, log_level),
        visibility = ["//visibility:public"],
    )
