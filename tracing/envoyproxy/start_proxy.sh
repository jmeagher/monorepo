#!/usr/bin/env sh
LOGLVL=info
if [ "$3" != "" ] ; then
  LOGLVL=$3
fi
echo "1=$1"
echo "2=$2"
echo "3=$3"
echo "4=$4"

JAEGER_VERSION=v0.4.2
wget -O /usr/local/lib/libjaegertracing_plugin.so https://github.com/jaegertracing/jaeger-client-cpp/releases/download/$JAEGER_VERSION/libjaegertracing_plugin.linux_amd64.so

/usr/local/bin/envoy --v2-config-only -c $2 -l $LOGLVL --service-cluster $1