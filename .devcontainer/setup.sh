#!/bin/bash
# Setup extra shell helpers to make codespaces work a bit better
CODESPACES_DIR=$HOME/workspace/monorepo
CODESPACES_TMP=$CODESPACES_DIR/.codespaces-tmp

mkdir -p $CODESPACES_TMP
cd $CODESPACES_TMP

# Extra base packages
apt install -y python3-distutils python3-dev python3-pip \
  jq entr tmux vim

# My dotfiles setup
if [ ! -e dotfiles ] ; then
  git clone https://github.com/jmeagher/dotfiles.git
  mv ~/.zshrc ~/.zshrc.orig
  mv ~/.bashrc ~/.bashrc.orig
  mv ~/.gitconfig ~/.gitconfig_local
  ./setup.sh
fi

# Install and setup ibazel
# export PATH=$PATH:$CODESPACES_TMP/bazel-watcher/bazel-bin/ibazel/linux_amd64_pure_stripped
# echo "Installing bazel watcher, this runs bazel which takes a LONG time for the first run, be patient. It may be 10-15 minutes"
# git clone https://github.com/bazelbuild/bazel-watcher.git
# cd bazel-watcher
# bazel build //ibazel

cd $CODESPACES_DIR
