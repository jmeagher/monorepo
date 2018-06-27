FROM ubuntu:trusty

# RUN sysctl kernel.unprivileged_userns_clone=1
RUN apt-get update -q && apt-get install libxml2-utils wget unzip zip -y

ENV OS=linux
ENV BAZEL_VER=0.15.0

RUN URL="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VER}/bazel-${BAZEL_VER}-installer-${OS}-x86_64.sh" ; \
    wget -O install.sh "${URL}" && \
    chmod +x install.sh
RUN ./install.sh && \
    rm -f install.sh

RUN apt-get install python python-dev build-essential gcc openjdk-7-jdk docker.io -y
RUN apt-get install curl -y

RUN mkdir -p /app
WORKDIR /app
