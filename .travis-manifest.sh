#!/bin/sh
set -x -v
if [ "$TRAVIS_EVENT_TYPE" != "pull_request" ] &&
   [ "$TRAVIS_BRANCH" = "main" ]; then
     mkdir -p ~/.docker
     echo '{ "experimental" : "enabled" }' > ~/.docker/config.json
     echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
     docker manifest create  "${REPO}:${RELEASE}" "${REPO}:linux" "${REPO}:windows" "${REPO}:linux_ppc64le"
     docker manifest inspect "${REPO}:${RELEASE}"
     docker manifest push    "${REPO}:${RELEASE}"
fi
