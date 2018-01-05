#! /bin/sh
function dotest {
  if [ ! -f $1 ] ; then
     echo "Can't find file $1 in $(pwd)"
     return 1
  fi
  if grep org.scala-lang $1 > /dev/null ; then
     echo "Found an illegal import in $1"
     return 1
  fi
}

dotest third_party/maven_deps/generate_workspace.bzl
  