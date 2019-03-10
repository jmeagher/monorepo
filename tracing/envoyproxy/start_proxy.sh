#!/usr/bin/env sh
LOGLVL=info
if [ "$3" != "" ] ; then
  LOGLVL=$3
fi

# TODO: Move this to bazel?
JAEGER_VERSION=v0.4.2
wget -O /usr/local/lib/libjaegertracing_plugin.so https://github.com/jaegertracing/jaeger-client-cpp/releases/download/$JAEGER_VERSION/libjaegertracing_plugin.linux_amd64.so

apk add gettext
envsubst < $2 > $2.subst.yaml

if [ "$LOGLVL" = "debug" ] ; then
  cat $2.subst.yaml
fi

/usr/local/bin/envoy --v2-config-only -c $2.subst.yaml -l $LOGLVL --service-cluster $1