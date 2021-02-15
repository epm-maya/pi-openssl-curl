#!/bin/bash

set -ex

export TARGET_HOST=arm-linux-gnueabihf

pushd openssl

./Configure linux-generic32 no-shared \
 --prefix=$PWD/build/raspi

make -j5
make install_sw
make clean
mkdir -p ../build/openssl
cp -R $PWD/build/raspi ../build/openssl/

popd
