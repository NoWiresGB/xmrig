#!/bin/bash

# vars
timezone="Europe/London"
repo="https://github.com/NoWiresGB/xmrig.git"

# clean up things ready for build
rm -rf $PWD/build-output
docker stop xmrig-builder
docker rm xmrig-builder


# create build toolchain container
docker build -f DockerFile.build -t xmrig-builder:latest

# do the build
docker run -e TZ="${timezone}" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 ${repo}" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig.tar.gz $PWD/build-output/unraid-xmrig.tar.gz

# create app container from build
docker build -f DockerFile.app -t unrid-xmrig:latest
