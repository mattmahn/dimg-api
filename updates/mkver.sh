#!/usr/bin/env bash

readonly MAJOR_VERS=$1
readonly MINOR_VERS=$2
readonly PATCH_VERS=$3

for major in $(seq $MAJOR_VERS); do
  for minor in $(seq $MINOR_VERS); do
    for patch in $(seq $PATCH_VERS); do
      mkdir -p "$major/$minor/$patch"
      file="
      publisher=Distributed Interactive Mobile Gaming, Inc.
      pulishDate=2016-02-29
      version=$major.$minor.$patch
      size=4000
      minFrmeworkVer=1.0.1
      download=/download?major=$major&minor=$minor&patch=$patch"
    done
  done
done
