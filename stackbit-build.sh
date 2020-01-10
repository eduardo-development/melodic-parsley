#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e18467d7e184700194abf1c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e18467d7e184700194abf1c
curl -s -X POST https://api.stackbit.com/project/5e18467d7e184700194abf1c/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e18467d7e184700194abf1c/webhook/build/publish > /dev/null
