
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  SERVICE_HOST=172.17.0.1
elif [[ "$OSTYPE" == "darwin"* ]]; then
  SERVICE_HOST=host.docker.internal
fi

if [ ! -f WORKSPACE ] ; then
  finish 1 "Error, run this from the top level monorepo folder"
fi

dockerize() {
docker run jwilder/dockerize:0.6.0 "$@"
}

images() {
  for I in $@ ; do
    bazel run //tracing/$I -- --norun
  done
}
