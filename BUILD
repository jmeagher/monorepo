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
