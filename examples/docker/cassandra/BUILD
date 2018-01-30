
# Still figuring this out
# This will get the image installed in the local docker:
#   bazel run //examples/docker/cassandra:cassandra_test
#
# This will start cassandra in docker:
#   docker run --name mycassandra -d bazel/examples/docker/cassandra:cassandra_test
#
# For more help and options see https://hub.docker.com/_/cassandra/
container_image(
    name = "cassandra_single_node",
    base = "@cassandra3//image",
    entrypoint = '/load_data_and_run.sh',
    files = glob(['*.sh']),
    visibility = ["//visibility:public"],
)

exports_files(glob(["*.yaml"]))

container_test(
    name = "cassandra_image_test",
    configs = [":validation-tests.yaml"],
    image = "@cassandra3//image",
    size = "small",
)