#!/bin/bash

set -ex

rm -rf build || true
rm -rf openssl || true
rm -rf curl || true
rm build.tar.gz || true

. var-pi.sh

./fetch.sh

./build-openssl.sh

./build-curl.sh

./remove-unused.sh

tar czf build.tar.gz build

