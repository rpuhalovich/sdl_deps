#!/bin/bash

function gitCloneCommit() {
    git clone --recursive $1 $3
    cd $3
    git checkout $2
    cd -
}

rm -rf lib lib.tar.gz

gitCloneCommit https://github.com/rpuhalovich/zsl.git 762e535c2945c071af1e13a3ca91321a2def8853 ./lib/zsl

gitCloneCommit https://github.com/rpuhalovich/ctools.git 31a454fbd8363b84dc4fc6430916c3cc566a3729 ./lib/ctools
cmake -S ./lib/ctools -B ./lib/ctools/build -DCMAKE_BUILD_TYPE=Release
cmake --build ./lib/ctools/build --config Release

wget "https://github.com/recp/cglm/archive/refs/tags/v0.9.6.tar.gz"
tar -xf "v0.9.6.tar.gz"
mv "cglm-0.9.6" "./lib/cglm"
