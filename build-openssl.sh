#!/bin/bash

set -ex

export TARGET_HOST=arm-linux-gnueabihf

pushd openssl

./Configure linux-generic32 no-shared \
 --prefix=$PWD/build

make -j5
make install_sw
make clean
mkdir -p ../build
cp -R $PWD/build ..

popd
