#!/bin/bash

# Proxy settings [optional] - set if your network requires a proxy to connect to the Internet
export http_proxy=your_http_proxy_here
export https_proxy=your_https_proxy_here
export no_proxy=localhost

# Docker image settings
## REGISTRY: [optional] - Docker registry path including trailing "/". Example: registry.company.com/demo/
export REGISTRY=
## IMAGE: <required> - Docker image name for this project. Example: myapp
export IMAGE=keras_cv_examples
## VERSION: [optional] - Version tag for this Docker image. Example: v20180302
export VERSION=v$(date +%Y%m%d)
export TAG=$(if [ -z "${VERSION}" ]; then echo ""; else echo ":${VERSION}"; fi) 
## BUILD_OPTS: [optional] - arguments for the docker image build command
export BUILD_OPTS="--build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} --build-arg no_proxy=${no_proxy}"

# Docker container runtime settings
## CONTAINER_NAME: [optional] - Name of the Docker container including the --name switch. Example --name myapp
export CONTAINER=${IMAGE}
export CONTAINER_NAME="--name ${CONTAINER}"
## Port map [optional] - Mapping of external to internal ports including the -p switch. Example -p 80:8080 
export PORT_MAP="-p 5555:8888"
## Volume map [optional] - Mapping of external to internal paths including the -v switch. Example $(pwd):/wd
export VOL_MAP="-v $(pwd):/wd"
## Network [optional] - Network name including the --net switch. Example --net mynet
export NETWORK=
## RUN_OPTS [optional] - additional options to specify with the run comman. Example -e POSTGRES_DB=dbname
export RUN_OPTS="-e http_proxy=$http_proxy -e https_proxy=$https_proxy -e no_proxy=$no_proxy --rm"

