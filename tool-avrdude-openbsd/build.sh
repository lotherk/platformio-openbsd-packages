#!/bin/sh

MACHINE=$(uname -m)

rm -rf pkg
mkdir pkg
cp package.json pkg/
cp avrdude pkg/

cp /usr/local/bin/avrdude pkg/avrdude_bin
cp /usr/local/lib/libavrdude* pkg/
cp /usr/local/lib/libusb* pkg/
cp /usr/local/share/examples/avrdude/avrdude.conf pkg/

sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

pio package pack pkg/
