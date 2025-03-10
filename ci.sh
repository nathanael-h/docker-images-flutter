#!/usr/bin/env bash

set -e

if [ "$CIRRUS_BRANCH" != "master" ]
then
    docker buildx build --platform linux/amd64,linux/arm64 \
       --tag ghcr.io/nathanael-h/docker-images-flutter:${FLUTTER_VERSION/+/-} \
       --tag ghcr.io/nathanael-h/docker-images-flutter:$DOCKER_TAG \
       --build-arg flutter_version=$FLUTTER_VERSION \
       sdk
    exit 0
fi

echo $GITHUB_TOKEN | docker login ghcr.io -u nathanael-h --password-stdin

docker buildx build --platform linux/amd64,linux/arm64 --push \
   --tag ghcr.io/nathanael-h/docker-images-flutter:${FLUTTER_VERSION/+/-} \
   --tag ghcr.io/nathanael-h/docker-images-flutter:$DOCKER_TAG \
   --build-arg flutter_version=$FLUTTER_VERSION \
   sdk
