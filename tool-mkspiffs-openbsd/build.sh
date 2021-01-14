#!/bin/sh

MACHINE=$(uname -m)

if [ "${MACHINE}" = "aarch64" ]; then
	MACHINE="arm64"
fi

rm -rf pkg
mkdir pkg
cp package.json pkg/
sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

cp /usr/local/bin/mkspiffs pkg/

pio package pack pkg/
