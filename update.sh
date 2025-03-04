#!/bin/sh

rm -f SDL3_ttf.tar.gz

rm -rf tmp
mkdir -p tmp
cd tmp

wget "https://github.com/libsdl-org/SDL_ttf/releases/download/release-3.2.0/SDL3_ttf-3.2.0.tar.gz"
tar -xf SDL3_ttf-3.2.0.tar.gz
mv SDL3_ttf-3.2.0 SDL3_ttf
rm SDL3_ttf-3.2.0.tar.gz

cd SDL3_ttf/external
./download.sh
cd ../..

rm -rf SDL3_ttf/Xcode
rm -rf SDL3_ttf/external/harfbuzz/test
rm -rf SDL3_ttf/external/harfbuzz/docs
rm -rf SDL3_ttf/external/harfbuzz/NEWS
rm -rf SDL3_ttf/external/harfbuzz/meson.build
rm -rf SDL3_ttf/external/freetype/docs

tar -cf SDL3_ttf.tar.gz SDL3_ttf

cd ..

cp tmp/SDL3_ttf.tar.gz .
