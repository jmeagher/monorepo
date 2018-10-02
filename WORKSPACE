workspace(name="jmeagher_monorepo")

# Settings to check and update regularly
rules_to_load = [
    ("scala",    "f33c6a659e3af540de35df1413f57f31d36d70c7", "bazelbuild"),
    ("docker",   "0ef3e002e90434c794b86a86609d3ba59b1ddeeb", "bazelbuild"),
    ("go",       "00a664876d6300951e7fa8766e0dfd42cdac67ad", "bazelbuild"),
    ("python",   "8b5d0683a7d878b28fffe464779c8a53659fc645", "bazelbuild"),
    ("rust",     "88022d175adb48aa5f8904f95dfc716c543b3f1e", "bazelbuild"),
]

# Load all the base rules
load("//tools/build_rules:rules_loader.bzl", "load_build_rules")
load_build_rules(rules_to_load)

# Scala setup
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()
load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
# register_toolchains("//tools/build_rules:strict_scala_toolchain")
scala_register_toolchains()

# Setup importing maven based external dependencies
# See dependencies.yaml for info about this
load("//3rdparty:workspace.bzl", "maven_dependencies")
maven_dependencies()


# Go support (used for docker testing)
load("@io_bazel_rules_go//go:def.bzl",
     "go_rules_dependencies", "go_register_toolchains")
go_rules_dependencies()
go_register_toolchains()


# Setup docker support
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
load("@io_bazel_rules_python//python:pip.bzl", "pip_repositories", "pip_import")
pip_repositories()

pip_import(
   name = "my_python_deps",
   requirements = "//3rdparty:requirements.txt",
)
load("@my_python_deps//:requirements.bzl", "pip_install")
pip_install()


# Rust support
load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
rust_repositories()


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
