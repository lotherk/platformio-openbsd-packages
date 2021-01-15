#!/bin/sh

MACHINE=$(uname -m)

rm -rf pkg
mkdir pkg
cp package.json pkg/
sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

cp /usr/local/bin/esptool pkg/

pio package pack pkg/
