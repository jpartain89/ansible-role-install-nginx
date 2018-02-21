#!/bin/bash -e

cd "/tmp/nginx/zlib-1.2.11" &&

sudo auto-apt run ./configure &&
sudo make &&
sudo checkinstall -y \
    --maintainer root \
    --pkgname zlib \
    --pkgversion zlib-1.2.11 \
    --pakdir /tmp/nginx
