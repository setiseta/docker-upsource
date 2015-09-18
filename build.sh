#!/bin/sh

REPO="seti/upsource"
TAG=${1:-"2.0.4"}

docker build -t $REPO:$TAG $(dirname $0) || exit $?
echo $REPO:$TAG image is ready.
