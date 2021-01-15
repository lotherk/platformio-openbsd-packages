#!/bin/sh

MACHINE=$(uname -m)

rm -rf pkg
mkdir pkg
cp package.json pkg/
sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

cd pkg
mkdir -p bin include lib/gcc lib/pkgconfig libexec/gcc

cp -r /usr/local/avr avr
cp /usr/local/bin/avr-* bin/
cp /usr/local/bin/libusb-config bin/
cp /usr/local/include/usb.h include/
cp -r /usr/local/include/libusb-1.0 include/
cp -r /usr/local/lib/gcc/avr lib/gcc/
cp -r /usr/local/lib/pkgconfig/libusb* lib/pkgconfig/
cp /usr/local/lib/libusb* lib/
cp -r /usr/local/libexec/gcc/avr libexec/gcc/


cd ..

pio package pack pkg/
