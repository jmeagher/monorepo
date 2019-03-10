load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_build_rules(rules_to_load):
  for rule, commit, org in rules_to_load:
    http_archive(
                 name = "io_bazel_rules_%s" % rule,
                 url = "https://github.com/%s/rules_%s/archive/%s.zip" % (org, rule, commit),
                 type = "zip",
                 strip_prefix= "rules_%s-%s" % (rule, commit)
                 )
