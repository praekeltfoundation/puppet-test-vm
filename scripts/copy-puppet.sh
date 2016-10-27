#!/bin/bash

PUPPET_DIR=${1:?Please provide puppet source dir.}; shift
BASE_DIR=$(dirname $(dirname ${0}))

rsync -av --exclude='.*' --exclude='vendor/*' --delete \
      ${PUPPET_DIR%/}/ ${BASE_DIR}/puppet/
