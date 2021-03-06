load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_build_rules(rules_to_load):
  for rule, commit, sha256, org, name_pattern in rules_to_load:
    if sha256 and len(sha256) > 0:
      http_archive(
                 name = name_pattern % rule,
                 url = "https://github.com/%s/rules_%s/archive/%s.zip" % (org, rule, commit),
                 sha256 = sha256,
                 type = "zip",
                 strip_prefix= "rules_%s-%s" % (rule, commit)
                 )
    else:
      http_archive(
                 name = name_pattern % rule,
                 url = "https://github.com/%s/rules_%s/archive/%s.zip" % (org, rule, commit),
                 type = "zip",
                 strip_prefix= "rules_%s-%s" % (rule, commit)
                 )
