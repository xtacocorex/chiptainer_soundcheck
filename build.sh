#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-chiptainer_soundcheck}

case "$1" in
    build)
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        ;;
    tag)
        docker tag chiptainer_soundcheck xtacocorex/chiptainer_soundcheck
        ;;
    push)
        docker push xtacocorex/chiptainer_soundcheck
        ;;
    all)
        echo "BUILDING"
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        echo "TAGGING"
        docker tag chiptainer_soundcheck xtacocorex/chiptainer_soundcheck
        echo "PUSHING"
        docker push xtacocorex/chiptainer_soundcheck
        ;;
    remove-tags)
        docker rmi `docker images | grep chiptainer_soundcheck | grep "<none>" | tr -s " " | cut -d " " -f 3`
        ;;
esac
