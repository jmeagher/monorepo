workspace(name = "jmeagher_monorepo")

# Settings to check and update regularly
rules_to_load = [
    ("scala", "886bc9cf6d299545510b39b4872bbb5dc7526cb3", "bazelbuild", "io_bazel_rules_%s"),
    ("jvm_external", "754b16440d50db635ae084ec1e8052bb83878532", "bazelbuild", "rules_%s"),
    ("docker", "b2bf38db3856a0e4165dfee4229c25426994ea20", "bazelbuild", "io_bazel_rules_%s"),
    ("go", "ce6cc4bb00afd965e86beee8efb734a8f6621b54", "bazelbuild", "io_bazel_rules_%s"),
    ("python", "38f86fb55b698c51e8510c807489c9f4e047480e", "bazelbuild", "io_bazel_rules_%s"),
    # ("rust", "4a9d0e0b6c66f1e98d15cbd3cccc8100a0454fc9", "bazelbuild", "io_bazel_rules_%s"),
]

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Base part needed for at least rust
http_archive(
    name = "bazel_skylib",
    sha256 = "eb5c57e4c12e68c0c20bc774bfbc60a568e800d025557bc4ea022c6479acc867",
    strip_prefix = "bazel-skylib-0.6.0",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/0.6.0.tar.gz",
)

# Load all the base rules
load("//tools/build_rules:rules_loader.bzl", "load_build_rules")

load_build_rules(rules_to_load)

# Scala setup
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

register_toolchains("//tools/build_rules:strict_scala_toolchain")
# load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
# scala_register_toolchains()

# Java version details
scala_dep_ver = "2.11"
akka_ver = "2.5.8"
akka_http_ver = "10.0.11"
# Setup importing maven based external dependencies
# When modifying this pin specific versions with bazel run @unpinned_maven//:pin
load("@rules_jvm_external//:defs.bzl", "maven_install")
maven_install(
    artifacts = [
        "com.datastax.cassandra:cassandra-driver-core:3.4.0",
    ], 
        repositories = [
            "https://repo.maven.apache.org/maven2/",
    ],
    maven_install_json = "//:maven_install.json"
)
load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()


# Go support
http_archive(
    name = "bazel_gazelle",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.19.1/bazel-gazelle-v0.19.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.19.1/bazel-gazelle-v0.19.1.tar.gz",
    ],
    sha256 = "86c6d481b3f7aedc1d60c1c211c6f76da282ae197c3b3160f54bd3a8f847896f",
)


load(
    "@io_bazel_rules_go//go:deps.bzl",
    "go_rules_dependencies",
    "go_register_toolchains",
)

go_rules_dependencies()

go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

# gazelle:repository_macro my-go-repositories.bzl%my_go_repositories
gazelle_dependencies()

# Setup docker support
load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

# Docker testing images
load(
    "@io_bazel_rules_docker//python:image.bzl",
    _py_image_repos = "repositories",
)

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

_py_image_repos()

load(
    "@io_bazel_rules_docker//scala:image.bzl",
    _scala_image_repos = "repositories",
)

_scala_image_repos()

load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

# Expanded python support for pip import capability
load("@io_bazel_rules_python//python:pip.bzl", "pip_repositories", "pip3_import")

pip_repositories()

pip3_import(
    name = "my_python_deps",
    requirements = "//3rdparty:requirements.txt",
)

load("@my_python_deps//:requirements.bzl", "pip_install")

pip_install()

# Rust support
# Removed for now since it's been delicate to maintain and I'm not working with it now
# load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")
# rust_repositories()
# load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")
# bazel_version(name = "bazel_version")

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

container_pull(
    name = "envoyproxy",
    registry = "index.docker.io",
    # Picked a recent build at random from https://hub.docker.com/r/envoyproxy/envoy-alpine/tags/
    repository = "envoyproxy/envoy-alpine",
    tag = "200b0e41641be46471c2ce3d230aae395fda7ded",
)

# Load external golang repos
# To add or update new external go dependencies edit go.mod and run ...
# bazel run //:gazelle -- update-repos -to_macro my-go-repositories.bzl%my_go_repositories -from_file go.mod
#
# To update build files for any external uses
# Update build files with bazel run //:gazelle
load("//:my-go-repositories.bzl", "my_go_repositories")
my_go_repositories()

# This is not really supported any more, but works better with non-go-module projects.
# Don't expect this to work all that reliably.
# go get github.com/scele/rules_go_dep/dep2bazel
# cline the uber/jaeger-client-go project and from the top level of that run
# dep2bazel -o ../monorepo/jaeger-go-deps.bzl  Gopkg.lock
# Change the main function name in the generated .bzl file to jaeger_go_deps
# load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("//:jaeger-go-deps.bzl", "jaeger_go_deps")
jaeger_go_deps()
go_repository(
    name = "com_github_uber_jaeger_client_go",
    importpath = "github.com/uber/jaeger-client-go",
    commit = "1a782e2da844727691fef1757c72eb190c2909f0",
)