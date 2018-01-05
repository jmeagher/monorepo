# The following dependencies were calculated from:
#
# generate_workspace -m . -r=https://repo1.maven.org/maven2


def generated_maven_jars():
  # pom.xml got requested version
  # jpm:maven_deps:jar:0.0.1-SNAPSHOT
  native.maven_jar(
      name = "com_twitter_finatra_finatra_http_2_11",
      artifact = "com.twitter.finatra:finatra-http_2.11:2.1.6",
      sha1 = "30fe9cd2edd60c581a463fb7974988dd5302824c",
  )


  # com.lihaoyi:fastparse_2.11:jar:1.0.0
  native.maven_jar(
      name = "com_lihaoyi_fastparse_utils_2_11",
      artifact = "com.lihaoyi:fastparse-utils_2.11:1.0.0",
      sha1 = "98716ae2093a51449f41485009ce1bb1cefd3336",
  )


  # com.google.inject:guice:jar:4.0
  native.maven_jar(
      name = "aopalliance_aopalliance",
      artifact = "aopalliance:aopalliance:1.0",
      sha1 = "0235ba8b489512805ac13a8f9ea77a1ca5ebe3e8",
  )


  # commons-fileupload:commons-fileupload:jar:1.3.1 wanted version 2.2
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "commons_io_commons_io",
      artifact = "commons-io:commons-io:2.4",
      sha1 = "b1b6ea3b7e4aa4f492509a4952029cd8e48019ad",
  )


  # com.twitter:util-jvm_2.11:jar:6.34.0 got requested version
  # com.twitter:util-events_2.11:jar:6.34.0 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  # com.twitter:util-logging_2.11:jar:6.34.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_app_2_11",
      artifact = "com.twitter:util-app_2.11:6.34.0",
      sha1 = "8dc679805fd7e7365d16cd38f2275a5ad66c543f",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  # com.twitter:finagle-core_2.11:jar:6.35.0 wanted version 1.9
  # com.twitter:util-codec_2.11:jar:6.34.0 wanted version 1.9
  native.maven_jar(
      name = "commons_codec_commons_codec",
      artifact = "commons-codec:commons-codec:1.3",
      sha1 = "fd32786786e2adb664d5ecc965da47629dca14ba",
  )


  # com.twitter:finagle-stats_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_common_metrics",
      artifact = "com.twitter.common:metrics:0.0.38",
      sha1 = "2541fb836e0d97207ec058907595f3aefd9e8003",
  )


  # com.lihaoyi:ammonite-runtime_2.11:jar:1.0.3
  native.maven_jar(
      name = "org_scalaj_scalaj_http_2_11",
      artifact = "org.scalaj:scalaj-http_2.11:2.3.0",
      sha1 = "9c0e4dbb5c2b908b1ee239edf803e893efd6d198",
  )


  # pom.xml got requested version
  # jpm:maven_deps:jar:0.0.1-SNAPSHOT
  native.maven_jar(
      name = "com_lihaoyi_ammonite_2_11_11",
      artifact = "com.lihaoyi:ammonite_2.11.11:1.0.3",
      sha1 = "011950733ec2f6065aab01ae6ccaa355401f4e4f",
  )


  # com.google.inject.extensions:guice-multibindings:jar:4.0 got requested version
  # com.google.inject.extensions:guice-assistedinject:jar:4.0 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # net.codingwell:scala-guice_2.11:jar:4.0.0 got requested version
  native.maven_jar(
      name = "com_google_inject_guice",
      artifact = "com.google.inject:guice:4.0",
      sha1 = "0f990a43d3725781b6db7cd0acf0a8b62dfd1649",
  )


  # com.twitter.common:base:jar:0.0.115
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  native.maven_jar(
      name = "com_twitter_common_util_system_mocks",
      artifact = "com.twitter.common:util-system-mocks:0.0.104",
      sha1 = "01b241fcce5ff4e2b4b1e67138a2c0dd7d983516",
  )


  # com.lihaoyi:ammonite-runtime_2.11:jar:1.0.3
  # io.get-coursier:coursier-cache_2.11:jar:1.0.0-RC10 got requested version
  native.maven_jar(
      name = "io_get_coursier_coursier_2_11",
      artifact = "io.get-coursier:coursier_2.11:1.0.0-RC10",
      sha1 = "6b00fe6611d944c56db652e1c4819bcfe3a94a62",
  )


  # com.lihaoyi:fastparse-utils_2.11:jar:1.0.0 wanted version 0.1.4
  # com.lihaoyi:scalaparse_2.11:jar:1.0.0 wanted version 0.1.4
  # com.lihaoyi:fansi_2.11:jar:0.2.3 got requested version
  # com.lihaoyi:derive_2.11:jar:0.4.4 got requested version
  # com.lihaoyi:upickle_2.11:jar:0.4.4 got requested version
  # com.lihaoyi:fastparse_2.11:jar:1.0.0 wanted version 0.1.4
  # com.lihaoyi:pprint_2.11:jar:0.5.2 got requested version
  # com.lihaoyi:ammonite-terminal_2.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_sourcecode_2_11",
      artifact = "com.lihaoyi:sourcecode_2.11:0.1.3",
      sha1 = "97b9b3b76a2488ab3c009305f559467de81b2a85",
  )


  # com.twitter.inject:inject-modules_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-request-scope_2.11:jar:2.1.6 got requested version
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.twitter:finagle-http_2.11:jar:6.35.0
  # com.twitter:finagle-thrift_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_finagle_core_2_11",
      artifact = "com.twitter:finagle-core_2.11:6.35.0",
      sha1 = "32bb2033c01e6bd85e0d5ed4a934c9b64f6b57ec",
  )


  # org.scalaz:scalaz-effect_2.11:bundle:7.2.13 got requested version
  # org.scalaz:scalaz-concurrent_2.11:bundle:7.2.13 got requested version
  # io.get-coursier:coursier_2.11:jar:1.0.0-RC10
  native.maven_jar(
      name = "org_scalaz_scalaz_core_2_11",
      artifact = "org.scalaz:scalaz-core_2.11:7.2.13",
      sha1 = "6dfdb13dca81c0a6c6fb52ed3471f2001c5cd4c5",
  )


  # com.twitter.finatra:finatra-jackson_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_finatra_finatra_scalap_compiler_deps_2_11",
      artifact = "com.twitter.finatra:finatra-scalap-compiler-deps_2.11:2.0.0",
      sha1 = "d2583de3e2fadd2bea27e30d480477993498e827",
  )


  # org.scalaz:scalaz-concurrent_2.11:bundle:7.2.13
  native.maven_jar(
      name = "org_scalaz_scalaz_effect_2_11",
      artifact = "org.scalaz:scalaz-effect_2.11:7.2.13",
      sha1 = "b3f9a1ed08ebbd39ea212a9601202e5a116c559c",
  )


  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_github_javaparser_javaparser_core",
      artifact = "com.github.javaparser:javaparser-core:3.2.5",
      sha1 = "c00bf4bbcaa2ecb51bcbdd483bc58b8d569bf88c",
  )


  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  # net.codingwell:scala-guice_2.11:jar:4.0.0 got requested version
  native.maven_jar(
      name = "com_google_inject_extensions_guice_multibindings",
      artifact = "com.google.inject.extensions:guice-multibindings:4.0",
      sha1 = "f4509545b4470bbcc865aa500ad6fef2e97d28bf",
  )


  # com.fasterxml.jackson.datatype:jackson-datatype-joda:bundle:2.4.4 got requested version
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter.finatra:finatra-jackson_2.11:jar:2.1.6
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4 got requested version
  native.maven_jar(
      name = "com_fasterxml_jackson_core_jackson_databind",
      artifact = "com.fasterxml.jackson.core:jackson-databind:2.4.4",
      sha1 = "e2ff13c3de2f5a2ab2449a3dace2b0d1c37bd8ee",
  )


  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  # com.lihaoyi:ammonite-compiler_2.11.11:jar:1.0.3 got requested version
  native.maven_jar(
      name = "com_lihaoyi_ammonite_runtime_2_11",
      artifact = "com.lihaoyi:ammonite-runtime_2.11:1.0.3",
      sha1 = "6cecf108d4801ecd24779883c9e9e0dc45a5914b",
  )


  # com.fasterxml.jackson.datatype:jackson-datatype-joda:bundle:2.4.4 got requested version
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.fasterxml.jackson.core:jackson-databind:bundle:2.4.4
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4 got requested version
  native.maven_jar(
      name = "com_fasterxml_jackson_core_jackson_core",
      artifact = "com.fasterxml.jackson.core:jackson-core:2.4.4",
      sha1 = "c5cd3347c0a86d0dcfbf3da593d8431d5a789d54",
  )


  # com.twitter.common:util-executor-service-shutdown:jar:0.0.67 got requested version
  # com.twitter.common:base:jar:0.0.115
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter.common:util-system-mocks:jar:0.0.104 got requested version
  native.maven_jar(
      name = "com_twitter_common_quantity",
      artifact = "com.twitter.common:quantity:0.0.99",
      sha1 = "d21227bcba8ce8b71fa84b3dffbb1b7957e2a34c",
  )


  # com.twitter.inject:inject-modules_2.11:jar:2.1.6 got requested version
  # com.twitter:util-logging_2.11:jar:6.34.0
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_stats_2_11",
      artifact = "com.twitter:util-stats_2.11:6.34.0",
      sha1 = "8ae186461c4f2d131cb467609eb77e3994c41dfd",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  native.maven_jar(
      name = "org_apache_httpcomponents_httpcore",
      artifact = "org.apache.httpcomponents:httpcore:4.0.1",
      sha1 = "e813b8722c387b22e1adccf7914729db09bcb4a9",
  )


  # org.slf4j:slf4j-log4j12:jar:1.7.7
  native.maven_jar(
      name = "log4j_log4j",
      artifact = "log4j:log4j:1.2.17",
      sha1 = "5af35056b4d257e4b64b9e8069c0746e8b08629f",
  )


  # com.lihaoyi:scalaparse_2.11:jar:1.0.0
  native.maven_jar(
      name = "com_lihaoyi_fastparse_2_11",
      artifact = "com.lihaoyi:fastparse_2.11:1.0.0",
      sha1 = "334cc8841a7f72a16c258252232fd1db8c0e9791",
  )


  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "jline_jline",
      artifact = "jline:jline:2.14.3",
      sha1 = "5296978fd0c28c778ddbb6e1dc0c30cadb998eca",
  )


  # com.twitter:util-stats_2.11:jar:6.34.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_lint_2_11",
      artifact = "com.twitter:util-lint_2.11:6.34.0",
      sha1 = "d2dba16d55e9bf867f0ee65ee1d36ece92484636",
  )


  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # com.twitter.common:quantity:jar:0.0.99
  native.maven_jar(
      name = "com_twitter_common_collections",
      artifact = "com.twitter.common:collections:0.0.110",
      sha1 = "47368f9f7f94d67d2bb548919a81099e19484121",
  )


  # com.twitter:finagle-core_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_util_cache_2_11",
      artifact = "com.twitter:util-cache_2.11:6.34.0",
      sha1 = "b0caaf2f57f4c35947f2bb8d83c3525a05c1a595",
  )


  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-thrift_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_scrooge_core_2_11",
      artifact = "com.twitter:scrooge-core_2.11:4.7.0",
      sha1 = "697183bc00dd7b91b53169d1b063630f37ba2078",
  )


  # com.github.nscala-time:nscala-time_2.11:jar:1.6.0
  # com.twitter.inject:inject-core_2.11:jar:2.1.6 got requested version
  native.maven_jar(
      name = "org_joda_joda_convert",
      artifact = "org.joda:joda-convert:1.4",
      sha1 = "d61427070271b003e26dba5c7b9d9b6127d665bc",
  )


  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "org_clapper_grizzled_slf4j_2_11",
      artifact = "org.clapper:grizzled-slf4j_2.11:1.0.2",
      sha1 = "55f84482ff1122a9d559179841a34d2c7d48e057",
  )


  # org.apache.thrift:libthrift:pom:0.6.1 wanted version 1.5.8
  # org.slf4j:slf4j-log4j12:jar:1.7.7 got requested version
  # org.slf4j:jcl-over-slf4j:jar:1.7.7 got requested version
  # org.slf4j:log4j-over-slf4j:jar:1.7.7 got requested version
  # org.slf4j:jul-to-slf4j:jar:1.7.7 got requested version
  # org.clapper:grizzled-slf4j_2.11:jar:1.0.2
  native.maven_jar(
      name = "org_slf4j_slf4j_api",
      artifact = "org.slf4j:slf4j-api:1.7.7",
      sha1 = "2b8019b6249bb05d81d3a3094e468753e2b21311",
  )


  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_github_nscala_time_nscala_time_2_11",
      artifact = "com.github.nscala-time:nscala-time_2.11:1.6.0",
      sha1 = "55d3ad808c8e1f02a2adb43aa0673494f1022730",
  )


  # com.lihaoyi:ammonite-runtime_2.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite-util_2.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  # com.lihaoyi:ammonite-compiler_2.11.11:jar:1.0.3 got requested version
  native.maven_jar(
      name = "com_lihaoyi_ammonite_ops_2_11",
      artifact = "com.lihaoyi:ammonite-ops_2.11:1.0.3",
      sha1 = "7fb8681a4c2946a611d502353add5880cd94a5c3",
  )


  # com.twitter.finatra:finatra-slf4j_2.11:jar:2.1.6
  native.maven_jar(
      name = "org_slf4j_jcl_over_slf4j",
      artifact = "org.slf4j:jcl-over-slf4j:1.7.7",
      sha1 = "56003dcd0a31deea6391b9e2ef2f2dc90b205a92",
  )


  # com.fasterxml.jackson.datatype:jackson-datatype-joda:bundle:2.4.4 wanted version 2.4.0
  # com.fasterxml.jackson.core:jackson-databind:bundle:2.4.4 wanted version 2.4.0
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4 got requested version
  native.maven_jar(
      name = "com_fasterxml_jackson_core_jackson_annotations",
      artifact = "com.fasterxml.jackson.core:jackson-annotations:2.4.4",
      sha1 = "d3dad1a494f94579fca4b6a1142fb15fb68f0b2f",
  )


  # org.apache.thrift:libthrift:pom:0.6.1
  native.maven_jar(
      name = "org_apache_httpcomponents_httpclient",
      artifact = "org.apache.httpcomponents:httpclient:4.0.1",
      sha1 = "1d7d28fa738bdbfe4fbd895d9486308999bdf440",
  )


  # com.lihaoyi:ammonite-compiler_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_scalaparse_2_11",
      artifact = "com.lihaoyi:scalaparse_2.11:1.0.0",
      sha1 = "de02dbb33c7da19614c818dfbe3978e3d091a164",
  )


  # com.twitter.common:base:jar:0.0.115 got requested version
  # com.twitter.common:util-executor-service-shutdown:jar:0.0.67 got requested version
  # com.twitter:finagle-http_2.11:jar:6.35.0 got requested version
  # com.twitter.inject:inject-utils_2.11:jar:2.1.6
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # org.apache.thrift:libthrift:pom:0.6.1 wanted version 2.5
  # com.twitter.common:quantity:jar:0.0.99 got requested version
  # com.twitter.common:collections:jar:0.0.110 got requested version
  # com.twitter.common:util-system-mocks:jar:0.0.104 got requested version
  native.maven_jar(
      name = "commons_lang_commons_lang",
      artifact = "commons-lang:commons-lang:2.6",
      sha1 = "0ce1edb914c94ebc388f086c6827e8bdeec71ac2",
  )


  # com.twitter.inject:inject-server_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_finagle_stats_2_11",
      artifact = "com.twitter:finagle-stats_2.11:6.35.0",
      sha1 = "bda0ab44975263aabdd37c16dc931639fbe8142b",
  )


  # com.twitter.inject:inject-server_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_inject_inject_app_2_11",
      artifact = "com.twitter.inject:inject-app_2.11:2.1.6",
      sha1 = "36ba912e7bbd6fc30776b3ec4f29560bd03a17e0",
  )


  # com.twitter.common:base:jar:0.0.115 got requested version
  # com.twitter:util-cache_2.11:jar:6.34.0 got requested version
  # com.twitter.common:util-executor-service-shutdown:jar:0.0.67 got requested version
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # net.codingwell:scala-guice_2.11:jar:4.0.0
  # com.twitter:util-collection_2.11:jar:6.34.0 got requested version
  # com.twitter.common:quantity:jar:0.0.99 got requested version
  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4 got requested version
  # com.twitter.common:collections:jar:0.0.110 got requested version
  # com.twitter.common:util-system-mocks:jar:0.0.104 got requested version
  native.maven_jar(
      name = "com_google_code_findbugs_jsr305",
      artifact = "com.google.code.findbugs:jsr305:2.0.2",
      sha1 = "516c03b21d50a644d538de0f0369c620989cd8f0",
  )


  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_ammonite_repl_2_11_11",
      artifact = "com.lihaoyi:ammonite-repl_2.11.11:1.0.3",
      sha1 = "81491bd9f77050733e961579c46360c0838015a7",
  )


  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_github_scopt_scopt_2_11",
      artifact = "com.github.scopt:scopt_2.11:3.5.0",
      sha1 = "4adcea609ae83ae73be401872f0a36c018b34fea",
  )


  # com.twitter:finagle-core_2.11:jar:6.35.0
  native.maven_jar(
      name = "io_netty_netty",
      artifact = "io.netty:netty:3.10.1.Final",
      sha1 = "ca63e69a44f86ce822c73fee02267de6526acb68",
  )


  # com.twitter.common:metrics:jar:0.0.38
  native.maven_jar(
      name = "com_twitter_common_util_executor_service_shutdown",
      artifact = "com.twitter.common:util-executor-service-shutdown:0.0.67",
      sha1 = "eb2ebd26181f0be5a1763ecec11ac7e59ccd4d1a",
  )


  # com.twitter.finatra:finatra-slf4j_2.11:jar:2.1.6
  native.maven_jar(
      name = "org_slf4j_jul_to_slf4j",
      artifact = "org.slf4j:jul-to-slf4j:1.7.7",
      sha1 = "def21bc1a6e648ee40b41a84f1db443132913105",
  )


  # com.twitter.common:util-executor-service-shutdown:jar:0.0.67 got requested version
  # com.twitter.common:metrics:jar:0.0.38
  native.maven_jar(
      name = "com_twitter_common_base",
      artifact = "com.twitter.common:base:0.0.115",
      sha1 = "cc8d97ca520961348279a1970b708c94b8c9fa64",
  )


  # com.twitter.finatra:finatra-slf4j_2.11:jar:2.1.6
  native.maven_jar(
      name = "org_slf4j_log4j_over_slf4j",
      artifact = "org.slf4j:log4j-over-slf4j:1.7.7",
      sha1 = "d521cb26a9c4407caafcec302e7804b048b07cea",
  )


  # com.twitter.inject:inject-modules_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-utils_2.11:jar:2.1.6
  # com.twitter.inject:inject-app_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-request-scope_2.11:jar:2.1.6 got requested version
  # com.twitter.finatra:finatra-slf4j_2.11:jar:2.1.6 got requested version
  native.maven_jar(
      name = "com_twitter_inject_inject_core_2_11",
      artifact = "com.twitter.inject:inject-core_2.11:2.1.6",
      sha1 = "ae28a4a6ec7f7b3a1c00befab898c40d4ba1d260",
  )


  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4
  native.maven_jar(
      name = "com_thoughtworks_paranamer_paranamer",
      artifact = "com.thoughtworks.paranamer:paranamer:2.6",
      sha1 = "52c3c8d8876440d714e23036eb87bcc4244d9aa5",
  )


  # com.twitter:finagle-zipkin_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_finagle_thrift_2_11",
      artifact = "com.twitter:finagle-thrift_2.11:6.35.0",
      sha1 = "20b31dcfbf530e372063f0663f15daead20fe3a1",
  )


  # com.twitter:util-app_2.11:jar:6.34.0
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_registry_2_11",
      artifact = "com.twitter:util-registry_2.11:6.34.0",
      sha1 = "53dc57fff399159f30e4993bd413a77ecb834b9b",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_finatra_finatra_slf4j_2_11",
      artifact = "com.twitter.finatra:finatra-slf4j_2.11:2.1.6",
      sha1 = "ac60d43403e0d7358cdd8acd37243b9dd1472f57",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "commons_fileupload_commons_fileupload",
      artifact = "commons-fileupload:commons-fileupload:1.3.1",
      sha1 = "c621b54583719ac0310404463d6d99db27e1052c",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_inject_inject_request_scope_2_11",
      artifact = "com.twitter.inject:inject-request-scope_2.11:2.1.6",
      sha1 = "cb3f02dd3a7477778af7b82cae66da95ecb915fa",
  )


  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter.finatra:finatra-jackson_2.11:jar:2.1.6
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  native.maven_jar(
      name = "com_fasterxml_jackson_module_jackson_module_scala_2_11",
      artifact = "com.fasterxml.jackson.module:jackson-module-scala_2.11:2.4.4",
      sha1 = "506ac22fa6f0675a1a94411767cc4ac54d0130ac",
  )


  # com.twitter:finagle-http_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_logging_2_11",
      artifact = "com.twitter:util-logging_2.11:6.34.0",
      sha1 = "943cb5941f75a40b92eacc0ddd7c0a70864a3046",
  )


  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-stats_2.11:jar:6.35.0
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_events_2_11",
      artifact = "com.twitter:util-events_2.11:6.34.0",
      sha1 = "aacc7a685a02a4a448e1f3e04d9078374c40d3f9",
  )


  # com.lihaoyi:upickle_2.11:jar:0.4.4
  native.maven_jar(
      name = "org_spire_math_jawn_parser_2_11",
      artifact = "org.spire-math:jawn-parser_2.11:0.10.3",
      sha1 = "6eae9b1c7adf1656842355d2b7985629eb36fd0d",
  )


  # com.twitter.inject:inject-core_2.11:jar:2.1.6 got requested version
  # com.google.inject:guice:jar:4.0
  # com.twitter:util-collection_2.11:jar:6.34.0 got requested version
  native.maven_jar(
      name = "javax_inject_javax_inject",
      artifact = "javax.inject:javax.inject:1",
      sha1 = "6975da39a7040257bd51d21a231b76c915872d38",
  )


  # com.lihaoyi:pprint_2.11:jar:0.5.2 wanted version 0.2.4
  # com.lihaoyi:ammonite-util_2.11:jar:1.0.3 wanted version 0.2.4
  # com.lihaoyi:ammonite-terminal_2.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_fansi_2_11",
      artifact = "com.lihaoyi:fansi_2.11:0.2.3",
      sha1 = "8b366e1a06a553abedcbf1ab00c3431c9c7a65aa",
  )


  # com.lihaoyi:ammonite-runtime_2.11:jar:1.0.3
  native.maven_jar(
      name = "io_get_coursier_coursier_cache_2_11",
      artifact = "io.get-coursier:coursier-cache_2.11:1.0.0-RC10",
      sha1 = "2f6ad8d780c09ea5ba1e7ac820b0a6edcfe13451",
  )


  # com.lihaoyi:ammonite-compiler_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "org_javassist_javassist",
      artifact = "org.javassist:javassist:3.22.0-CR2",
      sha1 = "44eaf0990dea92f4bca4b9931b2239c0e8756ee7",
  )


  # com.twitter.inject:inject-server_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_inject_inject_modules_2_11",
      artifact = "com.twitter.inject:inject-modules_2.11:2.1.6",
      sha1 = "7a297f7266d78dc97a080a29cafd438b3ea7b6b2",
  )


  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.twitter.finatra:finatra-slf4j_2.11:jar:2.1.6 got requested version
  native.maven_jar(
      name = "com_twitter_finagle_http_2_11",
      artifact = "com.twitter:finagle-http_2.11:6.35.0",
      sha1 = "8bcbde3d13a00d98f841f2792d7a27ee5dbe33c2",
  )


  # com.twitter.inject:inject-server_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_twitter_server_2_11",
      artifact = "com.twitter:twitter-server_2.11:1.20.0",
      sha1 = "9534381c7702cd9a26e8a0f2e00d45ffe89dbf57",
  )


  # com.fasterxml.jackson.datatype:jackson-datatype-joda:bundle:2.4.4 wanted version 2.2
  # com.github.nscala-time:nscala-time_2.11:jar:1.6.0 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "joda_time_joda_time",
      artifact = "joda-time:joda-time:2.5",
      sha1 = "c73038a3688525aad5cf33409df483178290cd64",
  )


  # com.twitter:finagle-http_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_codec_2_11",
      artifact = "com.twitter:util-codec_2.11:6.34.0",
      sha1 = "28f51ac8e9b1b8a384da8ad92bc775c999424578",
  )


  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "net_codingwell_scala_guice_2_11",
      artifact = "net.codingwell:scala-guice_2.11:4.0.0",
      sha1 = "162de1d62413a3030c59f66e8449b82945e09118",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6 got requested version
  # org.apache.thrift:libthrift:pom:0.6.1
  native.maven_jar(
      name = "javax_servlet_servlet_api",
      artifact = "javax.servlet:servlet-api:2.5",
      sha1 = "5959582d97d8b61f4d154ca9e495aafd16726e34",
  )


  # com.twitter:util-core_2.11:jar:6.34.0
  native.maven_jar(
      name = "com_twitter_util_function_2_11",
      artifact = "com.twitter:util-function_2.11:6.34.0",
      sha1 = "158689c24715667ca3db753331297ad6139b6b2e",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_inject_inject_server_2_11",
      artifact = "com.twitter.inject:inject-server_2.11:2.1.6",
      sha1 = "38545cd0289078cae364c6c02ebb54ae0b700a04",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_github_spullara_mustache_java_compiler",
      artifact = "com.github.spullara.mustache.java:compiler:0.8.18",
      sha1 = "afc3d67ddefe7f3b0956d8aca08c8aac298862c3",
  )


  # org.apache.thrift:libthrift:pom:0.6.1
  native.maven_jar(
      name = "org_slf4j_slf4j_log4j12",
      artifact = "org.slf4j:slf4j-log4j12:1.5.8",
      sha1 = "da00a151c4db31b5be23e5f2b9f528735fddc384",
  )


  # com.twitter.finatra:finatra-http_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_finatra_finatra_jackson_2_11",
      artifact = "com.twitter.finatra:finatra-jackson_2.11:2.1.6",
      sha1 = "70c0e27372d040d02074c1280bacbc9fdd1c073d",
  )


  # com.twitter:util-stats_2.11:jar:6.34.0 got requested version
  # com.twitter:util-cache_2.11:jar:6.34.0 got requested version
  # com.twitter:util-registry_2.11:jar:6.34.0 got requested version
  # com.twitter:util-jvm_2.11:jar:6.34.0 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6 got requested version
  # com.twitter.inject:inject-app_2.11:jar:2.1.6 got requested version
  # com.twitter:util-app_2.11:jar:6.34.0
  # com.twitter:util-collection_2.11:jar:6.34.0 got requested version
  # com.twitter:util-codec_2.11:jar:6.34.0 got requested version
  # com.twitter:util-logging_2.11:jar:6.34.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_core_2_11",
      artifact = "com.twitter:util-core_2.11:6.34.0",
      sha1 = "3bdfb6ca85806806b21a23c2b78d9ff301714676",
  )


  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6
  # com.twitter:finagle-thrift_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "org_apache_thrift_libthrift",
      artifact = "org.apache.thrift:libthrift:0.6.1",
      sha1 = "f08a912ce02debbaa803353686964b3c5fcfdb53",
  )


  # com.twitter.inject:inject-server_2.11:jar:2.1.6 got requested version
  # com.twitter.finatra:finatra-utils_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_inject_inject_utils_2_11",
      artifact = "com.twitter.inject:inject-utils_2.11:2.1.6",
      sha1 = "bb541509ae17b214b692da512819306253c8e98d",
  )


  # com.lihaoyi:ammonite-util_2.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_upickle_2_11",
      artifact = "com.lihaoyi:upickle_2.11:0.4.4",
      sha1 = "c1fc8ac28457a669314ce36c63e97c0e1b5b5522",
  )


  # com.twitter:finagle-core_2.11:jar:6.35.0
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  native.maven_jar(
      name = "com_twitter_util_jvm_2_11",
      artifact = "com.twitter:util-jvm_2.11:6.34.0",
      sha1 = "f073a31c47a7b5df73eeff97239f53fe1a9b4dd2",
  )


  # com.lihaoyi:upickle_2.11:jar:0.4.4
  native.maven_jar(
      name = "com_lihaoyi_derive_2_11",
      artifact = "com.lihaoyi:derive_2.11:0.4.4",
      sha1 = "f3dadc1bc74d25c45915db03a1441419d6d5c9cc",
  )


  # com.twitter.finatra:finatra-jackson_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_twitter_finatra_finatra_utils_2_11",
      artifact = "com.twitter.finatra:finatra-utils_2.11:2.1.6",
      sha1 = "d85520d03ca0082aa30673ef00d81eeec1ce30dc",
  )


  # org.apache.thrift:libthrift:pom:0.6.1
  native.maven_jar(
      name = "junit_junit",
      artifact = "junit:junit:4.4",
      sha1 = "8f35ee1f35d2dadbb5029991449ee90c1bab4d4a",
  )


  # com.twitter:util-collection_2.11:jar:6.34.0
  native.maven_jar(
      name = "commons_collections_commons_collections",
      artifact = "commons-collections:commons-collections:3.2.2",
      sha1 = "8ad72fe39fa8c91eaaf12aadb21e0c3661fe26d5",
  )


  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_ammonite_terminal_2_11",
      artifact = "com.lihaoyi:ammonite-terminal_2.11:1.0.3",
      sha1 = "e79b38fffc3d2b7c53b0ed91304033ab07ac6da4",
  )


  # com.lihaoyi:ammonite-runtime_2.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  # com.lihaoyi:ammonite-compiler_2.11.11:jar:1.0.3 got requested version
  native.maven_jar(
      name = "com_lihaoyi_ammonite_util_2_11",
      artifact = "com.lihaoyi:ammonite-util_2.11:1.0.3",
      sha1 = "a7263657bf8f63406ef245dc18ada78bde9e8275",
  )


  # com.lihaoyi:ammonite-repl_2.11.11:jar:1.0.3 got requested version
  # com.lihaoyi:ammonite_2.11.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_ammonite_compiler_2_11_11",
      artifact = "com.lihaoyi:ammonite-compiler_2.11.11:1.0.3",
      sha1 = "27064917a3d746d7c7ebd210021b896bfd60fbb4",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  native.maven_jar(
      name = "commons_logging_commons_logging",
      artifact = "commons-logging:commons-logging:1.1.1",
      sha1 = "5043bfebc3db072ed80fbd362e7caf00e885d8ae",
  )


  # com.twitter:twitter-server_2.11:jar:1.20.0
  native.maven_jar(
      name = "com_twitter_finagle_zipkin_2_11",
      artifact = "com.twitter:finagle-zipkin_2.11:6.35.0",
      sha1 = "9c48d3017dc24a61bcbb9f3c1cfd7c5678980221",
  )


  # com.twitter.common:metrics:jar:0.0.38
  native.maven_jar(
      name = "com_twitter_common_stats_util",
      artifact = "com.twitter.common:stats-util:0.0.59",
      sha1 = "9dfcedb305ce25062c4092a229a3180e96cdc888",
  )


  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_google_inject_extensions_guice_assistedinject",
      artifact = "com.google.inject.extensions:guice-assistedinject:4.0",
      sha1 = "8fa6431da1a2187817e3e52e967535899e2e46ca",
  )


  # com.twitter:finagle-core_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_util_collection_2_11",
      artifact = "com.twitter:util-collection_2.11:6.34.0",
      sha1 = "6a81f40064af82e7769c4ed1f7a2cf5f70650e14",
  )


  # com.twitter.finatra:finatra-jackson_2.11:jar:2.1.6
  native.maven_jar(
      name = "com_fasterxml_jackson_datatype_jackson_datatype_joda",
      artifact = "com.fasterxml.jackson.datatype:jackson-datatype-joda:2.4.4",
      sha1 = "cd947e76c6aacab1e015b6a06efb0553b4967d6d",
  )


  # com.lihaoyi:ammonite-ops_2.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_geny_2_11",
      artifact = "com.lihaoyi:geny_2.11:0.1.2",
      sha1 = "668fcf02255bbcc0d8e4a0ac9b14de4c25807604",
  )


  # com.lihaoyi:ammonite-util_2.11:jar:1.0.3
  native.maven_jar(
      name = "com_lihaoyi_pprint_2_11",
      artifact = "com.lihaoyi:pprint_2.11:0.5.2",
      sha1 = "4aa1f7c8db19a8472e4e905238c859c6652ddb39",
  )


  # com.twitter:finagle-http_2.11:jar:6.35.0 got requested version
  # com.twitter.common:stats-util:jar:0.0.59 got requested version
  # com.twitter:util-collection_2.11:jar:6.34.0 got requested version
  # com.twitter.common:quantity:jar:0.0.99 got requested version
  # com.twitter:finagle-stats_2.11:jar:6.35.0 got requested version
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  # com.twitter.common:collections:jar:0.0.110 got requested version
  # com.twitter.common:util-system-mocks:jar:0.0.104 got requested version
  # com.github.spullara.mustache.java:compiler:bundle:0.8.18 got requested version
  # com.fasterxml.jackson.module:jackson-module-scala_2.11:bundle:2.4.4 wanted version 15.0
  # com.twitter.common:base:jar:0.0.115 got requested version
  # com.twitter:util-cache_2.11:jar:6.34.0 got requested version
  # com.twitter.common:util-executor-service-shutdown:jar:0.0.67 got requested version
  # com.twitter.inject:inject-core_2.11:jar:2.1.6
  # com.twitter.common:metrics:jar:0.0.38 got requested version
  # com.google.inject:guice:jar:4.0 got requested version
  # com.twitter:finagle-zipkin_2.11:jar:6.35.0 got requested version
  # com.twitter:twitter-server_2.11:jar:1.20.0 got requested version
  # net.codingwell:scala-guice_2.11:jar:4.0.0 got requested version
  native.maven_jar(
      name = "com_google_guava_guava",
      artifact = "com.google.guava:guava:16.0.1",
      sha1 = "5fa98cd1a63c99a44dd8d3b77e4762b066a5d0c5",
  )


  # io.get-coursier:coursier-cache_2.11:jar:1.0.0-RC10
  native.maven_jar(
      name = "org_scalaz_scalaz_concurrent_2_11",
      artifact = "org.scalaz:scalaz-concurrent_2.11:7.2.13",
      sha1 = "0d28ea488cc168fe623278c78224c5067f702683",
  )


  # com.twitter:finagle-core_2.11:jar:6.35.0
  native.maven_jar(
      name = "com_twitter_util_hashing_2_11",
      artifact = "com.twitter:util-hashing_2.11:6.34.0",
      sha1 = "f96f2af4b3dcccf97fd987a7ea7c60857b1b5535",
  )


  # com.twitter:util-core_2.11:jar:6.34.0
  # com.twitter:finagle-core_2.11:jar:6.35.0 got requested version
  native.maven_jar(
      name = "com_twitter_jsr166e",
      artifact = "com.twitter:jsr166e:1.0.0",
      sha1 = "dc8b472bb653a97ecde9b109fa698168c98ce943",
  )




def generated_java_libraries():
  native.java_library(
      name = "com_twitter_finatra_finatra_http_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finatra_finatra_http_2_11//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_datatype_jackson_datatype_joda",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_github_nscala_time_nscala_time_2_11",
          ":com_github_spullara_mustache_java_compiler",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_assistedinject",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
          ":com_thoughtworks_paranamer_paranamer",
          ":com_twitter_common_base",
          ":com_twitter_common_collections",
          ":com_twitter_common_metrics",
          ":com_twitter_common_quantity",
          ":com_twitter_common_stats_util",
          ":com_twitter_common_util_executor_service_shutdown",
          ":com_twitter_common_util_system_mocks",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_finagle_stats_2_11",
          ":com_twitter_finagle_thrift_2_11",
          ":com_twitter_finagle_zipkin_2_11",
          ":com_twitter_finatra_finatra_jackson_2_11",
          ":com_twitter_finatra_finatra_scalap_compiler_deps_2_11",
          ":com_twitter_finatra_finatra_slf4j_2_11",
          ":com_twitter_finatra_finatra_utils_2_11",
          ":com_twitter_inject_inject_app_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_inject_inject_modules_2_11",
          ":com_twitter_inject_inject_request_scope_2_11",
          ":com_twitter_inject_inject_server_2_11",
          ":com_twitter_inject_inject_utils_2_11",
          ":com_twitter_jsr166e",
          ":com_twitter_scrooge_core_2_11",
          ":com_twitter_twitter_server_2_11",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_cache_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_collection_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_events_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_hashing_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_codec_commons_codec",
          ":commons_collections_commons_collections",
          ":commons_fileupload_commons_fileupload",
          ":commons_io_commons_io",
          ":commons_lang_commons_lang",
          ":commons_logging_commons_logging",
          ":io_netty_netty",
          ":javax_inject_javax_inject",
          ":javax_servlet_servlet_api",
          ":joda_time_joda_time",
          ":junit_junit",
          ":log4j_log4j",
          ":net_codingwell_scala_guice_2_11",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
          ":org_apache_thrift_libthrift",
          ":org_clapper_grizzled_slf4j_2_11",
          ":org_joda_joda_convert",
          ":org_slf4j_jcl_over_slf4j",
          ":org_slf4j_jul_to_slf4j",
          ":org_slf4j_log4j_over_slf4j",
          ":org_slf4j_slf4j_api",
          ":org_slf4j_slf4j_log4j12",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_fastparse_utils_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_fastparse_utils_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "aopalliance_aopalliance",
      visibility = ["//visibility:public"],
      exports = ["@aopalliance_aopalliance//jar"],
  )


  native.java_library(
      name = "commons_io_commons_io",
      visibility = ["//visibility:public"],
      exports = ["@commons_io_commons_io//jar"],
  )


  native.java_library(
      name = "com_twitter_util_app_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_app_2_11//jar"],
      runtime_deps = [
          ":com_twitter_jsr166e",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_registry_2_11",
      ],
  )


  native.java_library(
      name = "commons_codec_commons_codec",
      visibility = ["//visibility:public"],
      exports = ["@commons_codec_commons_codec//jar"],
  )


  native.java_library(
      name = "com_twitter_common_metrics",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_metrics//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_guice",
          ":com_twitter_common_base",
          ":com_twitter_common_collections",
          ":com_twitter_common_quantity",
          ":com_twitter_common_stats_util",
          ":com_twitter_common_util_executor_service_shutdown",
          ":com_twitter_common_util_system_mocks",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "org_scalaj_scalaj_http_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_scalaj_scalaj_http_2_11//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_2_11_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_2_11_11//jar"],
      runtime_deps = [
          ":com_github_javaparser_javaparser_core",
          ":com_github_scopt_scopt_2_11",
          ":com_lihaoyi_ammonite_compiler_2_11_11",
          ":com_lihaoyi_ammonite_ops_2_11",
          ":com_lihaoyi_ammonite_repl_2_11_11",
          ":com_lihaoyi_ammonite_runtime_2_11",
          ":com_lihaoyi_ammonite_terminal_2_11",
          ":com_lihaoyi_ammonite_util_2_11",
          ":com_lihaoyi_derive_2_11",
          ":com_lihaoyi_fansi_2_11",
          ":com_lihaoyi_fastparse_2_11",
          ":com_lihaoyi_fastparse_utils_2_11",
          ":com_lihaoyi_geny_2_11",
          ":com_lihaoyi_pprint_2_11",
          ":com_lihaoyi_scalaparse_2_11",
          ":com_lihaoyi_sourcecode_2_11",
          ":com_lihaoyi_upickle_2_11",
          ":io_get_coursier_coursier_2_11",
          ":io_get_coursier_coursier_cache_2_11",
          ":jline_jline",
          ":org_javassist_javassist",
          ":org_scalaj_scalaj_http_2_11",
          ":org_scalaz_scalaz_concurrent_2_11",
          ":org_scalaz_scalaz_core_2_11",
          ":org_scalaz_scalaz_effect_2_11",
          ":org_spire_math_jawn_parser_2_11",
      ],
  )


  native.java_library(
      name = "com_google_inject_guice",
      visibility = ["//visibility:public"],
      exports = ["@com_google_inject_guice//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_google_guava_guava",
          ":javax_inject_javax_inject",
      ],
  )


  native.java_library(
      name = "com_twitter_common_util_system_mocks",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_util_system_mocks//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_common_quantity",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "io_get_coursier_coursier_2_11",
      visibility = ["//visibility:public"],
      exports = ["@io_get_coursier_coursier_2_11//jar"],
      runtime_deps = [
          ":org_scalaz_scalaz_core_2_11",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_sourcecode_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_sourcecode_2_11//jar"],
  )


  native.java_library(
      name = "com_twitter_finagle_core_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finagle_core_2_11//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_cache_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_collection_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_hashing_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_codec_commons_codec",
          ":commons_collections_commons_collections",
          ":io_netty_netty",
          ":javax_inject_javax_inject",
      ],
  )


  native.java_library(
      name = "org_scalaz_scalaz_core_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_scalaz_scalaz_core_2_11//jar"],
  )


  native.java_library(
      name = "com_twitter_finatra_finatra_scalap_compiler_deps_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finatra_finatra_scalap_compiler_deps_2_11//jar"],
  )


  native.java_library(
      name = "org_scalaz_scalaz_effect_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_scalaz_scalaz_effect_2_11//jar"],
      runtime_deps = [
          ":org_scalaz_scalaz_core_2_11",
      ],
  )


  native.java_library(
      name = "com_github_javaparser_javaparser_core",
      visibility = ["//visibility:public"],
      exports = ["@com_github_javaparser_javaparser_core//jar"],
  )


  native.java_library(
      name = "com_google_inject_extensions_guice_multibindings",
      visibility = ["//visibility:public"],
      exports = ["@com_google_inject_extensions_guice_multibindings//jar"],
      runtime_deps = [
          ":com_google_inject_guice",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_core_jackson_databind",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_core_jackson_databind//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_fasterxml_jackson_core_jackson_core",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_runtime_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_runtime_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_ammonite_ops_2_11",
          ":com_lihaoyi_ammonite_util_2_11",
          ":io_get_coursier_coursier_2_11",
          ":io_get_coursier_coursier_cache_2_11",
          ":org_scalaj_scalaj_http_2_11",
          ":org_scalaz_scalaz_concurrent_2_11",
          ":org_scalaz_scalaz_core_2_11",
          ":org_scalaz_scalaz_effect_2_11",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_core_jackson_core",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_core_jackson_core//jar"],
  )


  native.java_library(
      name = "com_twitter_common_quantity",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_quantity//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_common_collections",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "com_twitter_util_stats_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_stats_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_lint_2_11",
      ],
  )


  native.java_library(
      name = "org_apache_httpcomponents_httpcore",
      visibility = ["//visibility:public"],
      exports = ["@org_apache_httpcomponents_httpcore//jar"],
  )


  native.java_library(
      name = "log4j_log4j",
      visibility = ["//visibility:public"],
      exports = ["@log4j_log4j//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_fastparse_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_fastparse_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_fastparse_utils_2_11",
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "jline_jline",
      visibility = ["//visibility:public"],
      exports = ["@jline_jline//jar"],
  )


  native.java_library(
      name = "com_twitter_util_lint_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_lint_2_11//jar"],
  )


  native.java_library(
      name = "com_twitter_common_collections",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_collections//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "com_twitter_util_cache_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_cache_2_11//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_util_core_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_scrooge_core_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_scrooge_core_2_11//jar"],
  )


  native.java_library(
      name = "org_joda_joda_convert",
      visibility = ["//visibility:public"],
      exports = ["@org_joda_joda_convert//jar"],
  )


  native.java_library(
      name = "org_clapper_grizzled_slf4j_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_clapper_grizzled_slf4j_2_11//jar"],
      runtime_deps = [
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "org_slf4j_slf4j_api",
      visibility = ["//visibility:public"],
      exports = ["@org_slf4j_slf4j_api//jar"],
  )


  native.java_library(
      name = "com_github_nscala_time_nscala_time_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_github_nscala_time_nscala_time_2_11//jar"],
      runtime_deps = [
          ":joda_time_joda_time",
          ":org_joda_joda_convert",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_ops_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_ops_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_geny_2_11",
      ],
  )


  native.java_library(
      name = "org_slf4j_jcl_over_slf4j",
      visibility = ["//visibility:public"],
      exports = ["@org_slf4j_jcl_over_slf4j//jar"],
      runtime_deps = [
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_core_jackson_annotations",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_core_jackson_annotations//jar"],
  )


  native.java_library(
      name = "org_apache_httpcomponents_httpclient",
      visibility = ["//visibility:public"],
      exports = ["@org_apache_httpcomponents_httpclient//jar"],
      runtime_deps = [
          ":commons_codec_commons_codec",
          ":commons_logging_commons_logging",
          ":org_apache_httpcomponents_httpcore",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_scalaparse_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_scalaparse_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_fastparse_2_11",
          ":com_lihaoyi_fastparse_utils_2_11",
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "commons_lang_commons_lang",
      visibility = ["//visibility:public"],
      exports = ["@commons_lang_commons_lang//jar"],
  )


  native.java_library(
      name = "com_twitter_finagle_stats_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finagle_stats_2_11//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_guice",
          ":com_twitter_common_base",
          ":com_twitter_common_collections",
          ":com_twitter_common_metrics",
          ":com_twitter_common_quantity",
          ":com_twitter_common_stats_util",
          ":com_twitter_common_util_executor_service_shutdown",
          ":com_twitter_common_util_system_mocks",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_events_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "com_twitter_inject_inject_app_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_app_2_11//jar"],
      runtime_deps = [
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_util_core_2_11",
      ],
  )


  native.java_library(
      name = "com_google_code_findbugs_jsr305",
      visibility = ["//visibility:public"],
      exports = ["@com_google_code_findbugs_jsr305//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_repl_2_11_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_repl_2_11_11//jar"],
      runtime_deps = [
          ":com_github_javaparser_javaparser_core",
          ":com_lihaoyi_ammonite_compiler_2_11_11",
          ":com_lihaoyi_ammonite_runtime_2_11",
          ":com_lihaoyi_ammonite_terminal_2_11",
          ":com_lihaoyi_ammonite_util_2_11",
          ":jline_jline",
      ],
  )


  native.java_library(
      name = "com_github_scopt_scopt_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_github_scopt_scopt_2_11//jar"],
  )


  native.java_library(
      name = "io_netty_netty",
      visibility = ["//visibility:public"],
      exports = ["@io_netty_netty//jar"],
  )


  native.java_library(
      name = "com_twitter_common_util_executor_service_shutdown",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_util_executor_service_shutdown//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_common_base",
          ":com_twitter_common_quantity",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "org_slf4j_jul_to_slf4j",
      visibility = ["//visibility:public"],
      exports = ["@org_slf4j_jul_to_slf4j//jar"],
      runtime_deps = [
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_twitter_common_base",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_base//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_common_collections",
          ":com_twitter_common_quantity",
          ":com_twitter_common_util_system_mocks",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "org_slf4j_log4j_over_slf4j",
      visibility = ["//visibility:public"],
      exports = ["@org_slf4j_log4j_over_slf4j//jar"],
      runtime_deps = [
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_twitter_inject_inject_core_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_core_2_11//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_github_nscala_time_nscala_time_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_assistedinject",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_registry_2_11",
          ":commons_io_commons_io",
          ":javax_inject_javax_inject",
          ":joda_time_joda_time",
          ":net_codingwell_scala_guice_2_11",
          ":org_clapper_grizzled_slf4j_2_11",
          ":org_joda_joda_convert",
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_thoughtworks_paranamer_paranamer",
      visibility = ["//visibility:public"],
      exports = ["@com_thoughtworks_paranamer_paranamer//jar"],
  )


  native.java_library(
      name = "com_twitter_finagle_thrift_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finagle_thrift_2_11//jar"],
      runtime_deps = [
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_scrooge_core_2_11",
          ":org_apache_thrift_libthrift",
      ],
  )


  native.java_library(
      name = "com_twitter_util_registry_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_registry_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_core_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_finatra_finatra_slf4j_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finatra_finatra_slf4j_2_11//jar"],
      runtime_deps = [
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":org_slf4j_jcl_over_slf4j",
          ":org_slf4j_jul_to_slf4j",
          ":org_slf4j_log4j_over_slf4j",
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "commons_fileupload_commons_fileupload",
      visibility = ["//visibility:public"],
      exports = ["@commons_fileupload_commons_fileupload//jar"],
      runtime_deps = [
          ":commons_io_commons_io",
      ],
  )


  native.java_library(
      name = "com_twitter_inject_inject_request_scope_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_request_scope_2_11//jar"],
      runtime_deps = [
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_inject_inject_core_2_11",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_module_jackson_module_scala_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_module_jackson_module_scala_2_11//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_thoughtworks_paranamer_paranamer",
      ],
  )


  native.java_library(
      name = "com_twitter_util_logging_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_logging_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_stats_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_util_events_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_events_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_app_2_11",
      ],
  )


  native.java_library(
      name = "org_spire_math_jawn_parser_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_spire_math_jawn_parser_2_11//jar"],
  )


  native.java_library(
      name = "javax_inject_javax_inject",
      visibility = ["//visibility:public"],
      exports = ["@javax_inject_javax_inject//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_fansi_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_fansi_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "io_get_coursier_coursier_cache_2_11",
      visibility = ["//visibility:public"],
      exports = ["@io_get_coursier_coursier_cache_2_11//jar"],
      runtime_deps = [
          ":io_get_coursier_coursier_2_11",
          ":org_scalaz_scalaz_concurrent_2_11",
          ":org_scalaz_scalaz_core_2_11",
          ":org_scalaz_scalaz_effect_2_11",
      ],
  )


  native.java_library(
      name = "org_javassist_javassist",
      visibility = ["//visibility:public"],
      exports = ["@org_javassist_javassist//jar"],
  )


  native.java_library(
      name = "com_twitter_inject_inject_modules_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_modules_2_11//jar"],
      runtime_deps = [
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_util_stats_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_finagle_http_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finagle_http_2_11//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_cache_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_collection_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_hashing_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_codec_commons_codec",
          ":commons_collections_commons_collections",
          ":commons_lang_commons_lang",
          ":io_netty_netty",
          ":javax_inject_javax_inject",
      ],
  )


  native.java_library(
      name = "com_twitter_twitter_server_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_twitter_server_2_11//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_google_guava_guava",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_finagle_thrift_2_11",
          ":com_twitter_finagle_zipkin_2_11",
          ":com_twitter_scrooge_core_2_11",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_events_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":org_apache_thrift_libthrift",
      ],
  )


  native.java_library(
      name = "joda_time_joda_time",
      visibility = ["//visibility:public"],
      exports = ["@joda_time_joda_time//jar"],
  )


  native.java_library(
      name = "com_twitter_util_codec_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_codec_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_core_2_11",
          ":commons_codec_commons_codec",
      ],
  )


  native.java_library(
      name = "net_codingwell_scala_guice_2_11",
      visibility = ["//visibility:public"],
      exports = ["@net_codingwell_scala_guice_2_11//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
      ],
  )


  native.java_library(
      name = "javax_servlet_servlet_api",
      visibility = ["//visibility:public"],
      exports = ["@javax_servlet_servlet_api//jar"],
  )


  native.java_library(
      name = "com_twitter_util_function_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_function_2_11//jar"],
  )


  native.java_library(
      name = "com_twitter_inject_inject_server_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_server_2_11//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_guice",
          ":com_twitter_common_base",
          ":com_twitter_common_collections",
          ":com_twitter_common_metrics",
          ":com_twitter_common_quantity",
          ":com_twitter_common_stats_util",
          ":com_twitter_common_util_executor_service_shutdown",
          ":com_twitter_common_util_system_mocks",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_finagle_stats_2_11",
          ":com_twitter_finagle_thrift_2_11",
          ":com_twitter_finagle_zipkin_2_11",
          ":com_twitter_inject_inject_app_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_inject_inject_modules_2_11",
          ":com_twitter_inject_inject_utils_2_11",
          ":com_twitter_scrooge_core_2_11",
          ":com_twitter_twitter_server_2_11",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_events_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_lang_commons_lang",
          ":org_apache_thrift_libthrift",
      ],
  )


  native.java_library(
      name = "com_github_spullara_mustache_java_compiler",
      visibility = ["//visibility:public"],
      exports = ["@com_github_spullara_mustache_java_compiler//jar"],
      runtime_deps = [
          ":com_google_guava_guava",
      ],
  )


  native.java_library(
      name = "org_slf4j_slf4j_log4j12",
      visibility = ["//visibility:public"],
      exports = ["@org_slf4j_slf4j_log4j12//jar"],
      runtime_deps = [
          ":log4j_log4j",
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_twitter_finatra_finatra_jackson_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finatra_finatra_jackson_2_11//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_datatype_jackson_datatype_joda",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_github_nscala_time_nscala_time_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_assistedinject",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
          ":com_thoughtworks_paranamer_paranamer",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_finatra_finatra_scalap_compiler_deps_2_11",
          ":com_twitter_finatra_finatra_utils_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_inject_inject_utils_2_11",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_cache_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_collection_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_hashing_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_codec_commons_codec",
          ":commons_collections_commons_collections",
          ":commons_io_commons_io",
          ":commons_lang_commons_lang",
          ":commons_logging_commons_logging",
          ":io_netty_netty",
          ":javax_inject_javax_inject",
          ":javax_servlet_servlet_api",
          ":joda_time_joda_time",
          ":junit_junit",
          ":log4j_log4j",
          ":net_codingwell_scala_guice_2_11",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
          ":org_apache_thrift_libthrift",
          ":org_clapper_grizzled_slf4j_2_11",
          ":org_joda_joda_convert",
          ":org_slf4j_slf4j_api",
          ":org_slf4j_slf4j_log4j12",
      ],
  )


  native.java_library(
      name = "com_twitter_util_core_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_core_2_11//jar"],
      runtime_deps = [
          ":com_twitter_jsr166e",
          ":com_twitter_util_function_2_11",
      ],
  )


  native.java_library(
      name = "org_apache_thrift_libthrift",
      visibility = ["//visibility:public"],
      exports = ["@org_apache_thrift_libthrift//jar"],
      runtime_deps = [
          ":commons_codec_commons_codec",
          ":commons_lang_commons_lang",
          ":commons_logging_commons_logging",
          ":javax_servlet_servlet_api",
          ":junit_junit",
          ":log4j_log4j",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
          ":org_slf4j_slf4j_api",
          ":org_slf4j_slf4j_log4j12",
      ],
  )


  native.java_library(
      name = "com_twitter_inject_inject_utils_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_inject_inject_utils_2_11//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_github_nscala_time_nscala_time_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_assistedinject",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_registry_2_11",
          ":commons_io_commons_io",
          ":commons_lang_commons_lang",
          ":javax_inject_javax_inject",
          ":joda_time_joda_time",
          ":net_codingwell_scala_guice_2_11",
          ":org_clapper_grizzled_slf4j_2_11",
          ":org_joda_joda_convert",
          ":org_slf4j_slf4j_api",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_upickle_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_upickle_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_derive_2_11",
          ":com_lihaoyi_sourcecode_2_11",
          ":org_spire_math_jawn_parser_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_util_jvm_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_jvm_2_11//jar"],
      runtime_deps = [
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_core_2_11",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_derive_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_derive_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_finatra_finatra_utils_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finatra_finatra_utils_2_11//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_github_nscala_time_nscala_time_2_11",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_extensions_guice_assistedinject",
          ":com_google_inject_extensions_guice_multibindings",
          ":com_google_inject_guice",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_http_2_11",
          ":com_twitter_inject_inject_core_2_11",
          ":com_twitter_inject_inject_utils_2_11",
          ":com_twitter_jsr166e",
          ":com_twitter_util_app_2_11",
          ":com_twitter_util_cache_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_collection_2_11",
          ":com_twitter_util_core_2_11",
          ":com_twitter_util_function_2_11",
          ":com_twitter_util_hashing_2_11",
          ":com_twitter_util_jvm_2_11",
          ":com_twitter_util_lint_2_11",
          ":com_twitter_util_logging_2_11",
          ":com_twitter_util_registry_2_11",
          ":com_twitter_util_stats_2_11",
          ":commons_codec_commons_codec",
          ":commons_collections_commons_collections",
          ":commons_io_commons_io",
          ":commons_lang_commons_lang",
          ":commons_logging_commons_logging",
          ":io_netty_netty",
          ":javax_inject_javax_inject",
          ":javax_servlet_servlet_api",
          ":joda_time_joda_time",
          ":junit_junit",
          ":log4j_log4j",
          ":net_codingwell_scala_guice_2_11",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
          ":org_apache_thrift_libthrift",
          ":org_clapper_grizzled_slf4j_2_11",
          ":org_joda_joda_convert",
          ":org_slf4j_slf4j_api",
          ":org_slf4j_slf4j_log4j12",
      ],
  )


  native.java_library(
      name = "junit_junit",
      visibility = ["//visibility:public"],
      exports = ["@junit_junit//jar"],
  )


  native.java_library(
      name = "commons_collections_commons_collections",
      visibility = ["//visibility:public"],
      exports = ["@commons_collections_commons_collections//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_terminal_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_terminal_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_fansi_2_11",
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_util_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_util_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_ammonite_ops_2_11",
          ":com_lihaoyi_derive_2_11",
          ":com_lihaoyi_fansi_2_11",
          ":com_lihaoyi_pprint_2_11",
          ":com_lihaoyi_sourcecode_2_11",
          ":com_lihaoyi_upickle_2_11",
          ":org_spire_math_jawn_parser_2_11",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_ammonite_compiler_2_11_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_ammonite_compiler_2_11_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_ammonite_ops_2_11",
          ":com_lihaoyi_ammonite_runtime_2_11",
          ":com_lihaoyi_ammonite_util_2_11",
          ":com_lihaoyi_fastparse_2_11",
          ":com_lihaoyi_fastparse_utils_2_11",
          ":com_lihaoyi_scalaparse_2_11",
          ":com_lihaoyi_sourcecode_2_11",
          ":org_javassist_javassist",
      ],
  )


  native.java_library(
      name = "commons_logging_commons_logging",
      visibility = ["//visibility:public"],
      exports = ["@commons_logging_commons_logging//jar"],
  )


  native.java_library(
      name = "com_twitter_finagle_zipkin_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_finagle_zipkin_2_11//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":com_fasterxml_jackson_module_jackson_module_scala_2_11",
          ":com_google_guava_guava",
          ":com_twitter_finagle_core_2_11",
          ":com_twitter_finagle_thrift_2_11",
          ":com_twitter_scrooge_core_2_11",
          ":com_twitter_util_codec_2_11",
          ":com_twitter_util_events_2_11",
          ":org_apache_thrift_libthrift",
      ],
  )


  native.java_library(
      name = "com_twitter_common_stats_util",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_common_stats_util//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_inject_guice",
          ":com_twitter_common_quantity",
          ":com_twitter_common_util_system_mocks",
          ":commons_lang_commons_lang",
      ],
  )


  native.java_library(
      name = "com_google_inject_extensions_guice_assistedinject",
      visibility = ["//visibility:public"],
      exports = ["@com_google_inject_extensions_guice_assistedinject//jar"],
      runtime_deps = [
          ":com_google_inject_guice",
      ],
  )


  native.java_library(
      name = "com_twitter_util_collection_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_collection_2_11//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_twitter_util_core_2_11",
          ":commons_collections_commons_collections",
          ":javax_inject_javax_inject",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_datatype_jackson_datatype_joda",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_datatype_jackson_datatype_joda//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_annotations",
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_fasterxml_jackson_core_jackson_databind",
          ":joda_time_joda_time",
      ],
  )


  native.java_library(
      name = "com_lihaoyi_geny_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_geny_2_11//jar"],
  )


  native.java_library(
      name = "com_lihaoyi_pprint_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_lihaoyi_pprint_2_11//jar"],
      runtime_deps = [
          ":com_lihaoyi_fansi_2_11",
          ":com_lihaoyi_sourcecode_2_11",
      ],
  )


  native.java_library(
      name = "com_google_guava_guava",
      visibility = ["//visibility:public"],
      exports = ["@com_google_guava_guava//jar"],
  )


  native.java_library(
      name = "org_scalaz_scalaz_concurrent_2_11",
      visibility = ["//visibility:public"],
      exports = ["@org_scalaz_scalaz_concurrent_2_11//jar"],
      runtime_deps = [
          ":org_scalaz_scalaz_core_2_11",
          ":org_scalaz_scalaz_effect_2_11",
      ],
  )


  native.java_library(
      name = "com_twitter_util_hashing_2_11",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_util_hashing_2_11//jar"],
  )


  native.java_library(
      name = "com_twitter_jsr166e",
      visibility = ["//visibility:public"],
      exports = ["@com_twitter_jsr166e//jar"],
  )


