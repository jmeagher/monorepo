
# Still figuring this out
# This will get the image installed in the local docker:
#   bazel run //examples/docker/cassandra:cassandra_test
#
# This will start cassandra in docker:
#   docker run --name mycassandra -d bazel/examples/docker/cassandra:cassandra_test
#
# For more help and options see https://hub.docker.com/_/cassandra/
container_image(
    name = "cassandra_test",
    base = "@cassandra3//image",
)
