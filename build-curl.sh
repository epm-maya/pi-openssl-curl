#!/bin/bash

set -ex

export TARGET_HOST=arm-linux-gnueabihf

export SSL_DIR=$PWD/openssl/build

pushd curl

autoreconf -fi

ARGUMENTS="\
    --disable-shared \
    --disable-verbose \
    --disable-manual \
    --disable-crypto-auth \
    --disable-unix-sockets \
    --disable-ares \
    --disable-rtsp \
    --disable-ipv6 \
    --disable-proxy \
    --disable-versioned-symbols \
    --enable-hidden-symbols \
    --without-libidn \
    --without-librtmp \
    --without-zlib \
    --disable-dict \
    --disable-file \
    --disable-ftp \
    --disable-ftps \
    --disable-gopher \
    --disable-imap \
    --disable-imaps \
    --disable-pop3 \
    --disable-pop3s \
    --disable-smb \
    --disable-smbs \
    --disable-smtp \
    --disable-smtps \
    --disable-telnet \
    --disable-tftp"

export AR=$TARGET_HOST-ar
export AS=$TARGET_HOST-as
export CC=$TARGET_HOST-gcc
export CXX=$TARGET_HOST-g++
export LD=$TARGET_HOST-ld
export RANLIB=$TARGET_HOST-ranlib
export STRIP=$TARGET_HOST-strip

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build \
            --with-ssl=$SSL_DIR $ARGUMENTS

make -j5
make install
make clean
mkdir -p ../build
cp -R $PWD/build ..

popd
