#!/bin/bash

rm -rf $PWD/build-output
docker stop xmrig-builder
docker rm xmrig-builder
docker build -f DockerFile.build -t xmrig-builder:latest
docker run -e TZ="Australia/Melbourne" -v $PWD/build-output:/home/docker/build-output -e SOURCE="--depth 1 https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
mv $PWD/build-output/xmrig.tar.gz $PWD/build-output/unraid-xmrig.tar.gz
