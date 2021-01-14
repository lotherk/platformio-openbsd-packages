#!/bin/sh
set -e

MACHINE=$(uname -m)

if [ "${MACHINE}" = "aarch64" ]; then
	MACHINE="arm64"
fi
rm -rf pkg build
mkdir pkg build
(
	cd build
	git clone https://github.com/earlephilhower/mklittlefs
	cd mklittlefs
	git submodule update --init
	gmake CXX=clang++ dist
	cp mklittlefs ../../pkg/
)

cp package.json pkg/
sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

pio package pack pkg/
