load("@io_bazel_rules_docker//container:container.bzl",
     "container_image",
     )

def envoy_config(name, file):
    container_image(
        name = name,
        base = "@envoyproxy//image",
        # entrypoint = '/load_data_and_run.sh',
        files = [file],
        # This is fairly delicate, it's copied from https://github.com/envoyproxy/envoy/blob/master/ci/Dockerfile-envoy-image
        cmd = "/usr/local/bin/envoy --v2-config-only -l info -c /%s" % file,
        visibility = ["//visibility:public"],
    )
