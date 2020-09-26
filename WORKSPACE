workspace(name = "jmeagher_monorepo")

# Settings to check and update regularly
rules_to_load = [
    ("scala", "f0c8d0759c3eeec7e7e94cd61e507b9b771b7641", "b0d698b6cc57b4474b412f056be66cbcc2a099295d6af7b0be5e83df0fc8911e", "bazelbuild", "io_bazel_rules_%s"),
    ("jvm_external", "54582a756201751b88d5d5f4a630985063b2f325", "", "bazelbuild", "rules_%s"),
    ("docker", "708e6c7c2d611c546b62fb21fbd2945fd8dc1cdb", "1f4dbc9ebb31284f6e4450b08a2c600a1c6837e5961205fa8d7c47bcd1f20de6", "bazelbuild", "io_bazel_rules_%s"),
    ("go", "64bfa14993c7841aaefbbe1f1aecaad72f302974", "84eba14421a7feca3a43fbd8f44b0fb9efa9364f2cd8e037721f88934467dead", "bazelbuild", "io_bazel_rules_%s"),
    ("python", "3baa2660569a76898d0f520c73b299ea39b6374d", "7122bef3e3ac44d5dd697a1411e2861dd7437000bc435d4be35e42589ebb9f9f", "bazelbuild", "rules_%s"),
    # ("rust", "4a9d0e0b6c66f1e98d15cbd3cccc8100a0454fc9", "bazelbuild", "io_bazel_rules_%s"),
]

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
    ],
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# Load all the base rules
load("//tools/build_rules:rules_loader.bzl", "load_build_rules")

load_build_rules(rules_to_load)

# Expanded python support for pip import capability
load("@rules_python//python:pip.bzl", "pip_repositories", "pip3_import")
pip_repositories()

pip3_import(
    name = "my_python_deps",
    requirements = "//3rdparty:requirements.txt",
)

load("@my_python_deps//:requirements.bzl", _python_3rd_party = "pip_install")
_python_3rd_party()
# pip_install()

# Scala setup
load("@io_bazel_rules_scala//:version.bzl", "bazel_version")
bazel_version(name = "bazel_version")
load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
scala_register_toolchains()
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()

# Go support
http_archive(
    name = "bazel_gazelle",
    sha256 = "72d339ff874a382f819aaea80669be049069f502d6c726a07759fdca99653c48",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.1/bazel-gazelle-v0.22.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.1/bazel-gazelle-v0.22.1.tar.gz",
    ],
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
    digest = "sha256:18698b13866b5e805420718e22ad32e3b3227182d3143aaaa937c6154bb5d2bb",
)

container_pull(
    name = "envoyproxy",
    registry = "index.docker.io",
    # Picked a recent build at random from https://hub.docker.com/r/envoyproxy/envoy-alpine/tags/
    repository = "envoyproxy/envoy-alpine",
    tag = "200b0e41641be46471c2ce3d230aae395fda7ded",
    digest = "sha256:ae046d3c3b1ebcdbf02cd924edfb2fe5e328ab462c3e44961cb4aac9be208491",
)

# Load external golang repos
# To add or update new external go dependencies edit go.mod and run ...
# bazel run //:gazelle -- update-repos -to_macro my-go-repositories.bzl%my_go_repositories -from_file go.mod

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