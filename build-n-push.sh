#!/bin/sh
set -e -x

sed <./Dockerfile.in >./Dockerfile s/REV=1/REV=$1/

IMAGE=quay.io/imikushin/myalpine:wtf

docker build -t ${IMAGE} .
docker push ${IMAGE}

rancher up --pull --force-upgrade --confirm-upgrade -d
