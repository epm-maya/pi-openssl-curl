#!/bin/bash

set -ex

export TARGET_HOST=arm-linux-gnueabihf

export AR=$TARGET_HOST-ar
export AS=$TARGET_HOST-as
export CC=$TARGET_HOST-gcc
export CXX=$TARGET_HOST-g++
export LD=$TARGET_HOST-ld
export RANLIB=$TARGET_HOST-ranlib
export STRIP=$TARGET_HOST-strip

pushd openssl

./Configure linux-generic32 no-shared \
 --prefix=$PWD/build

make -j5
make install_sw
make clean
mkdir -p ../build
cp -R $PWD/build ..

popd
