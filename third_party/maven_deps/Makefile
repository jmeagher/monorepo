# Handle a few bootstrap issues that 
# are external to bazel, but are needed for it to run

# Location of the workspace generator from https://github.com/bazelbuild/migration-tooling
WS_GEN ?= ../../../migration-tooling/bazel-bin/generate_workspace/generate_workspace
WS_GEN_AVAIL := $(shell command -v $(WS_GEN) 2> /dev/null)

all: verify_bin generate_workspace.bzl
	
verify_bin:
ifndef WS_GEN_AVAIL
	$(error "The workspace generator '$(WS_GEN)' is not available, see the top of this file for help")
endif

generate_workspace.bzl: Makefile $(WS_GEN)
	${WS_GEN} \
	  -a=com.twitter.finatra:finatra-http_2.11:2.1.6 \
	  -r=https://repo1.maven.org/maven2
