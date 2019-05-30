filegroup(
    name = "srcs",
    srcs = glob(
        ["*"],
        exclude = [
            "bazel-*",  # convenience symlinks
            ".*",  # mainly .git* files
        ],
    ) + [
        ".travis.yml",
    ],
    visibility = ["//src/test/shell/bazel:__pkg__"],
)

# gazelle:prefix github.com/jmeagher/monorepo
load("@bazel_gazelle//:def.bzl", "gazelle")

gazelle(name = "gazelle")
