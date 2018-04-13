#!/usr/bin/bash
set -ex

VERSION=v1.1

git clone https://git.zx2c4.com/cgit
cd cgit
git checkout $VERSION -b $VERSION

make get-git

make
make install