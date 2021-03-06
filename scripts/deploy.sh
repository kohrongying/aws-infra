#!/bin/bash

set -eu

action=$1
BASE_DIR="$(dirname "$0")"

docker run --rm \
    -v `pwd`:/apps \
    -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" \
    -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
    alpine/terragrunt:1.1.9 sh -c $BASE_DIR/$action.sh
