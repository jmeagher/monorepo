workspace(name = "jmeagher_monorepo")

# Settings to check and update regularly
rules_to_load = [
    ("scala", "9cb85352a060248a558fedecaa46832abbb2864b", "bazelbuild"),
    ("docker", "f962c24d59127ff3446756c06ff63af68c22645a", "bazelbuild"),
    ("go", "76925662d5f671bdc049b0aac493dafcd856ed3a", "bazelbuild"),
    ("python", "88532b624f74ab17138fb638d3c62750b5af5f9a", "bazelbuild"),
    ("rust", "4a9d0e0b6c66f1e98d15cbd3cccc8100a0454fc9", "bazelbuild"),
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

# Setup importing maven based external dependencies
# See dependencies.yaml for info about this
load("//3rdparty:workspace.bzl", "maven_dependencies")

maven_dependencies()

# Go support
http_archive(
    name = "bazel_gazelle",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/archive/587e0e9cc7ab78ac7926caa0d3378d29bc71080a.zip"],
    type = "zip",
    strip_prefix = "bazel-gazelle-587e0e9cc7ab78ac7926caa0d3378d29bc71080a",
)

load(
    "@io_bazel_rules_go//go:def.bzl",
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

load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

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

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

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