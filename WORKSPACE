workspace(name = "jmeagher_monorepo")

# Settings to check and update regularly
rules_to_load = [
    ("scala", "fadf4ce919a4deac1927c316bfb201c7d21128c1", "49475dcbf81463da644917de24f7e28b029b54a62076b5bd3ac1278d4f5e4543", "bazelbuild", "io_bazel_rules_%s"),
    ("jvm_external", "bad9e2501279aea5268b1b8a5463ccc1be8ddf65", "", "bazelbuild", "rules_%s"),
    ("docker", "62a1072965e98f74662a11ba89e11df77d7e4305", "4a2883552747c7b460c9a3bf3bbdddb3181ccfc01fcdc471842a00b3dbc82190", "bazelbuild", "io_bazel_rules_%s"),
    ("go", "f78ceebea7f1b340c76f5ad2758117966cd9015b", "04f71a220fa4ad87a7e8f7a08b63cda6bd7466342e86d780e9ae169d8b951081", "bazelbuild", "io_bazel_rules_%s"),
    ("python", "748aa53d7701e71101dfd15d800e100f6ff8e5d1", "d3e40ca3b7e00b72d2b1585e0b3396bcce50f0fc692e2b7c91d8b0dc471e3eaf", "bazelbuild", "io_bazel_rules_%s"),
    # ("rust", "4a9d0e0b6c66f1e98d15cbd3cccc8100a0454fc9", "bazelbuild", "io_bazel_rules_%s"),
]

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "bazel_skylib",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
    ],
    sha256 = "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

# Load all the base rules
load("//tools/build_rules:rules_loader.bzl", "load_build_rules")

load_build_rules(rules_to_load)

# Scala setup
load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
scala_register_toolchains()
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")
scala_repositories()

# Go support
http_archive(
    name = "bazel_gazelle",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.20.0/bazel-gazelle-v0.20.0.tar.gz",
    ],
    sha256 = "d8c45ee70ec39a57e7a05e5027c32b1576cc7f16d9dd37135b0eddde45cf1b10",
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