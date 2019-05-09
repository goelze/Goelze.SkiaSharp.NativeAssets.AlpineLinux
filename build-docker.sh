#!/bin/bash

docker build -t skiasharp-alpine .
mkdir -p ./runtimes/linux-x64/native
docker run --rm -v $(pwd)/runtimes/linux-x64/native:/temp skiasharp-alpine cp /build/skia/out/linux/x64/libSkiaSharp.so /temp/
