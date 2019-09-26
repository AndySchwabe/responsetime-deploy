#!/bin/sh

cd "$GITHUB_WORKSPACE" || exit

make "$@"
