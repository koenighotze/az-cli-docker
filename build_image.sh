#!/bin/sh
set -o nounset
set -o errexit

CREATED="$(date -u +%Y-%m-%dT%T%z)"
REVISION="$(CIRCLE_SHA1)"
BUILD_URL="$(CIRCLE_BUILD_URL)"
SOURCE="$(CIRCLE_REPOSITORY_URL)"

docker build \
  -t "koenighotze/azure-cli:${REVISION}" \
  --build-arg NAME="koenighotze/azure-cli" \
  --build-arg CREATED="$CREATED" \
  --build-arg TITLE="azure-cli docker wrapper" \
  --build-arg REVISION="$REVISION" \
  --build-arg BUILD_URL="$BUILD_URL" \
  --build-arg SOURCE="$SOURCE" \
  .
