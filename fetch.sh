#!/bin/bash

set -ex

git clone --depth 1 --single-branch -b OpenSSL_1_1_1k https://github.com/openssl/openssl.git

pushd openssl
git submodule update --init --recursive --recommend-shallow --depth 1
popd

git clone --depth 1 --single-branch -b curl-7_75_0 https://github.com/curl/curl.git
