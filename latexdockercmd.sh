#!/bin/sh
IMAGE=tiulpin/xelatex-docker:latest
wget https://github.com/tiulpin/xelatex-docker/raw/master/.latexmkrc -O .latexmkrc
docker pull "$IMAGE"
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "latexmk -cd -f -interaction=batchmode -pdf"
