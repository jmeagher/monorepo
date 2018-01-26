workspace(name="jmeagher_monorepo")

# Settings to check and update regularly
rules_scala_version     = "e88c689ec8e581cf6085e89676e427a4ab654498"
rules_docker_version    = "8aeab63328a82fdb8e8eb12f677a4e5ce6b183b1"
rules_go_version        = "a390e7f7eac912f6e67dc54acf67aa974d05f9c3"
rules_python_version    = "73a154a181a53ee9e021668918f8a5bfacbf3b43"

# Setup scala with the custom toolchain
http_archive(
             name = "io_bazel_rules_scala",
             url = "https://github.com/jmeagher/rules_scala/archive/%s.zip"%rules_scala_version,
             type = "zip",
             strip_prefix= "rules_scala-%s" % rules_scala_version
             )
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()
load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
register_toolchains("//tools/build_rules:strict_scala_toolchain")

# Setup importing maven based external dependencies
# See dependencies.yaml for info about this
load("//3rdparty:workspace.bzl", "maven_dependencies")
maven_dependencies()


# Go support (used for docker testing)
http_archive(
             name = "io_bazel_rules_go",
             url = "https://github.com/bazelbuild/rules_go/archive/%s.zip"%rules_go_version,
             type = "zip",
             strip_prefix= "rules_go-%s" % rules_go_version
             )
load("@io_bazel_rules_go//go:def.bzl",
     "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()


# Setup docker support
http_archive(
             name = "io_bazel_rules_docker",
             url = "https://github.com/bazelbuild/rules_docker/archive/%s.zip"%rules_docker_version,
             type = "zip",
             strip_prefix= "rules_docker-%s" % rules_docker_version
             )
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
    container_repositories = "repositories",
)
container_repositories()

# Docker testing images
load(
    "@io_bazel_rules_docker//python:image.bzl",
    _py_image_repos = "repositories",
)
_py_image_repos()

load(
    "@io_bazel_rules_docker//scala:image.bzl",
    _scala_image_repos = "repositories",
)
_scala_image_repos()


# Expanded python support for pip import capability
http_archive(
             name = "io_bazel_rules_python",
             url = "https://github.com/bazelbuild/rules_python/archive/%s.zip"%rules_python_version,
             type = "zip",
             strip_prefix= "rules_python-%s" % rules_python_version
             )
load("@io_bazel_rules_python//python:pip.bzl", "pip_repositories", "pip_import")
pip_repositories()

pip_import(
   name = "my_python_deps",
   requirements = "//3rdparty:requirements.txt",
)
load("@my_python_deps//:requirements.bzl", "pip_install")
pip_install()

# Load external docker containers

container_pull(
    name = "cassandra3",
    registry = "index.docker.io",
    repository = "library/cassandra",
    # 'tag' is also supported, but digest is encouraged for reproducibility.
    # note: couldn't get digest version to work
    tag = "3.11.1",
    # digest = "sha256:cb506985b360983d774e6af46e9071c377af48b9d9be1a3ce7235c34d59a8c40",
)
