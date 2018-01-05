licenses(["notice"])
load(":generate_workspace.bzl", "generated_java_libraries")
generated_java_libraries()

# Check for problem packages being imported from maven.
# If this fails the pom.xml probably needs an update
sh_test(
    name = "validate_maven_import",
    size = "small",
    srcs = ["validate_maven_import.sh"],
    data = [
        "generate_workspace.bzl",
        "Makefile",
        "pom.xml",
    ],
)
