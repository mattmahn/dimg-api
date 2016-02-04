#!/usr/bin/env bash

if [[ $1 =~ "build" ]]; then
  # build the docker image
  docker build -t dimg-api .
elif [[ $1 =~ "run" ]]; then
  # run the docker image
  docker run -p 4567:4567 dimg-api:latest
fi

