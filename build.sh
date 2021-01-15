#!/bin/sh

mkdir -p tmp
for p in tool*; do
	(
		cd ${p}; ./build.sh && rm -rf pkg build && mv tool*gz ../test/
	)
done
