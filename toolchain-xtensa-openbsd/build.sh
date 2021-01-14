#!/bin/sh

MACHINE=$(uname -m)

if [ "${MACHINE}" = "aarch64" ]; then
	MACHINE="amd64"
fi

rm -rf pkg
mkdir pkg
cp package.json pkg/
sed -i "s/SYSTEM_TEMPLATE/openbsd_${MACHINE}/g" pkg/package.json

cd pkg
mkdir -p bin lib/gcc libexec/gcc

cp /usr/local/bin/xtensa*  bin/
cp -rp /usr/local/libexec/gcc/xtensa-lx106-elf libexec/gcc/
cp -rp /usr/local/lib/gcc/xtensa-lx106-elf lib/gcc/
cp -rp /usr/local/xtensa-lx106-elf/lib .
cp -rp /usr/local/xtensa-lx106-elf/include .
cp -rp /usr/local/xtensa-lx106-elf .
cd ..

pio package pack pkg/
