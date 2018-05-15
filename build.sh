#!/usr/bin/env bash
set -ex

# docker registry information
USERNAME=dockreg.lebanon.cd-adapco.com:5000
# image name
IMAGE=hwfunc

docker build -t $USERNAME/$IMAGE:latest .
