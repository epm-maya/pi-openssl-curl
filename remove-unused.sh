#!/bin/bash

set -ex

function remove_unused() {
  pushd $1
  rm -rf lib/pkgconfig || true
  rm -rf lib/*.la || true
  rm -rf share || true
  popd
}

remove_unused build

