load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "application_action",
    exports = [
        "//external:jar/com/twitter/common/application_action"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "base",
    exports = [
        "//external:jar/com/twitter/common/base"
    ],
    runtime_deps = [
        ":util_system_mocks"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "collections",
    exports = [
        "//external:jar/com/twitter/common/collections"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "jdk_logging",
    exports = [
        "//external:jar/com/twitter/common/jdk_logging"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "metrics",
    exports = [
        "//external:jar/com/twitter/common/metrics"
    ],
    runtime_deps = [
        ":base",
        ":quantity",
        ":stats_util",
        ":util_executor_service_shutdown"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "quantity",
    exports = [
        "//external:jar/com/twitter/common/quantity"
    ],
    runtime_deps = [
        ":collections"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "stat",
    exports = [
        "//external:jar/com/twitter/common/stat"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "stat_registry",
    exports = [
        "//external:jar/com/twitter/common/stat_registry"
    ],
    runtime_deps = [
        ":stat"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "stats",
    exports = [
        "//external:jar/com/twitter/common/stats"
    ],
    runtime_deps = [
        ":application_action",
        ":stat_registry",
        ":stats_provider",
        ":util_sampler"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "stats_provider",
    exports = [
        "//external:jar/com/twitter/common/stats_provider"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "stats_util",
    exports = [
        "//external:jar/com/twitter/common/stats_util"
    ],
    runtime_deps = [
        ":util"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util",
    exports = [
        "//external:jar/com/twitter/common/util"
    ],
    runtime_deps = [
        ":jdk_logging",
        ":stats"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_executor_service_shutdown",
    exports = [
        "//external:jar/com/twitter/common/util_executor_service_shutdown"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_sampler",
    exports = [
        "//external:jar/com/twitter/common/util_sampler"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "util_system_mocks",
    exports = [
        "//external:jar/com/twitter/common/util_system_mocks"
    ],
    visibility = [
        "//visibility:public"
    ]
)


