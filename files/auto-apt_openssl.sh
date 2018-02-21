#!/bin/bash -e

cd "/tmp/nginx/openssl-1.1.0f" &&

./config --prefix=/usr &&
sudo make &&
sudo checkinstall -y \
    --maintainer root \
    --pkgname openssl \
    --pkgversion openssl-1.1.0f \
    --pakdir /tmp/nginx
