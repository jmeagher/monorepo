Basic Local Testing
---

1. Build all the needed docker images with
    ````
    for I in $(bazel query 'kind("app_layer", //tracing/...)' && bazel query 'kind("container_image_", //tracing/...)') ; do
      # This does the necessary builds and puts the image in docker
      bazel run $I -- --norun
    done
    ````
1. Launch all the services with `(cd tracing && docker-compose up)`

This will run a few requests through the system and should provide some traces in Jaeger. The traces should be available in the [search UI](http://localhost:16686/search).

Additional traces can be generated with `(cd tracing && docker-compose up basic_client)`