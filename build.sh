#!/bin/bash

function gitCloneCommit() {
    git clone --recursive $1 $3
    cd $3
    git checkout $2
    cd -
}

function getTarFile() {
    wget $1
    tar -xf $2
    mv $3 $4
    rm -rf $2
}

rm -rf lib lib.tar.gz

# zsl
gitCloneCommit https://github.com/rpuhalovich/zsl.git 762e535c2945c071af1e13a3ca91321a2def8853 ./lib/zsl

# ctools
gitCloneCommit https://github.com/rpuhalovich/ctools.git 31a454fbd8363b84dc4fc6430916c3cc566a3729 ./lib/ctools

# cglm
getTarFile "https://github.com/recp/cglm/archive/refs/tags/v0.9.6.tar.gz" v0.9.6.tar.gz cglm-0.9.6 ./lib/cglm

# SDL_shadercross
getTarFile "https://github.com/rpuhalovich/shadercross/releases/download/release/SDL3_shadercross-3.0.0-macos-arm64.tar.gz" SDL3_shadercross-3.0.0-macos-arm64.tar.gz SDL3_shadercross-3.0.0-macos-arm64 ./lib/SDL_shadercross-macos
getTarFile "https://github.com/rpuhalovich/shadercross/releases/download/release/SDL3_shadercross-3.0.0-linux-x64.tar.gz" SDL3_shadercross-3.0.0-linux-x64.tar.gz SDL3_shadercross-3.0.0-linux-x64 ./lib/SDL_shadercross-linux
getTarFile "https://github.com/rpuhalovich/shadercross/releases/download/release/SDL3_shadercross-3.0.0-windows-x64.tar.gz" SDL3_shadercross-3.0.0-windows-x64.tar.gz SDL3_shadercross-3.0.0-windows-x64 ./lib/SDL_shadercross-windows

# SDL
getTarFile "https://github.com/libsdl-org/SDL/releases/download/release-3.2.6/SDL3-3.2.6.tar.gz" SDL3-3.2.6.tar.gz SDL3-3.2.6 ./lib/SDL

# SDL_image
getTarFile "https://github.com/libsdl-org/SDL_image/releases/download/release-3.2.4/SDL3_image-3.2.4.tar.gz" SDL3_image-3.2.4.tar.gz SDL3_image-3.2.4 ./lib/SDL_image
git clone --recursive --depth=1 https://github.com/libsdl-org/jpeg.git -b v9f-SDL ./lib/SDL_image/external/jpeg
git clone --recursive --depth=1 https://github.com/libsdl-org/libpng.git -b v1.6.47-SDL ./lib/SDL_image/external/libpng
git clone --recursive --depth=1 https://github.com/libsdl-org/libwebp.git -b 1.3.2-SDL ./lib/SDL_image/external/libwebp
git clone --recursive --depth=1 https://github.com/libsdl-org/libtiff.git -b v4.6.0-SDL ./lib/SDL_image/external/libtiff
git clone --recursive --depth=1 https://github.com/libsdl-org/zlib.git -b v1.3.1-SDL ./lib/SDL_image/external/zlib
git clone --recursive --depth=1 https://github.com/libsdl-org/libjxl.git -b v0.7.2-SDL ./lib/SDL_image/external/libjxl
git clone --recursive --depth=1 https://github.com/libsdl-org/libavif.git -b v1.0.4-SDL ./lib/SDL_image/external/libavif
git clone --recursive --depth=1 https://github.com/libsdl-org/dav1d.git -b 1.2.1-SDL ./lib/SDL_image/external/dav1d
git clone --recursive --depth=1 https://github.com/libsdl-org/aom.git -b v3.6.1-SDL ./lib/SDL_image/external/aom

# SDL_ttf
getTarFile "https://github.com/libsdl-org/SDL_ttf/releases/download/release-3.2.0/SDL3_ttf-3.2.0.tar.gz" SDL3_ttf-3.2.0.tar.gz SDL3_ttf-3.2.0 ./lib/SDL_ttf
git clone --recursive --depth=1 https://github.com/libsdl-org/freetype.git -b VER-2-13-2-SDL ./lib/SDL_ttf/external/freetype
git clone --recursive --depth=1 https://github.com/libsdl-org/harfbuzz.git -b 8.1.1-SDL ./lib/SDL_ttf/external/harfbuzz
git clone --recursive --depth=1 https://github.com/libsdl-org/plutosvg.git -b v0.0.6-SDL ./lib/SDL_ttf/external/plutosvg
git clone --recursive --depth=1 https://github.com/libsdl-org/plutovg.git -b v0.0.12-SDL ./lib/SDL_ttf/external/plutovg

# curl
getTarFile "https://github.com/curl/curl/archive/refs/tags/curl-8_11_1.tar.gz" curl-8_11_1.tar.gz curl-curl-8_11_1 ./lib/curl

tar c lib | gzip --best > lib.tar.gz
