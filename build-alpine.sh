#!/bin/bash

git clone https://github.com/mono/skia.git -b v1.68.0

pushd skia

# sync deps
python tools/git-sync-deps

# generate build files
gn gen 'out/linux/x64' --args='is_official_build=true skia_enable_tools=false target_os="linux" target_cpu="x64" skia_use_icu=false skia_use_sfntly=false skia_use_piex=true skia_use_system_expat=false skia_use_system_freetype2=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_enable_gpu=true extra_cflags=[ "-DSKIA_C_DLL" ] linux_soname_version=""'

# build
ninja 'SkiaSharp' -C 'out/linux/x64'

popd
