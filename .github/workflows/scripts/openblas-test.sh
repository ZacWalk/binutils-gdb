#!/bin/bash

set -ex # stop bash script on error
. .github/workflows/scripts/base.sh

openblas_folder="$workspace_folder/build/openblas"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $openblas_folder ] && rm -r $openblas_folder
    mkdir -p $openblas_folder
ENDSSH

git clone --depth 1 https://github.com/xianyi/OpenBLAS.git openblas

cd openblas

sed -i '143,145d' ./common_arm64.h 

mkdir build/
cd build

cmd.exe //C cmake ..  -G Ninja -DCMAKE_C_COMPILER=clang -DBUILD_WITHOUT_LAPACK=1 -DNOFORTRAN=1 -DDYNAMIC_ARCH=0 -DTARGET=ARMV8 -DARCH=arm64 -DBINARY=64 -DUSE_OPENMP=0 -DCMAKE_SYSTEM_PROCESSOR=ARM64 -DCMAKE_CROSSCOMPILING=0 -DCMAKE_SYSTEM_NAME=Windows

cd ../../

scp -i $gcc_identity -r ./openblas/ $gcc_destination:$openblas_folder

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error

    cd $openblas_folder

    root_dir=$(pwd)

    # copy config.h from build/ to root
    cp build/config.h .

    # read specific line from file into variable
    line=$(sed -n '/include/=' build/kernel/CMakeFiles/camax_k.S)
    path_to_replace=$(sed -n "${line}p" build/kernel/CMakeFiles/camax_k.S)

    #remove prefix '#include ' from path_to_replace
    path_to_replace=${path_to_replace#'#include "'}

    #remove suffix 'zamax.S' from path_to_replace
    path_to_replace=${path_to_replace%'zamax.S"'}

    #find path_to_replace in all .S files in build/kernel/CMakeFiles folder and replace it with base path
    find ./build/kernel/CMakeFiles -name "*.S" -exec sed -i "s|$path_to_replace|$root_dir/kernel/arm64/|g" {} \;

    mkdir -p ./build/gas

    for file in ./build/kernel/CMakeFiles/*.S; do
        gcc -I$root_dir -E $root_dir/build/kernel/CMakeFiles/$(basename $file) > $root_dir/build/gas/$(basename $file).s;
        $gcc_build_folder/gas/as-new $root_dir/build/gas/$(basename $file).s -o $root_dir/build/gas/$(basename $file).S.obj;
    done
    rm ./build/gas/*.s
ENDSSH

scp -i $gcc_identity -r $gcc_destination:$openblas_folder/build/gas/ ./openblas/build/kernel/CMakeFiles/kernel.dir/CMakeFiles/

cd ./openblas

#remove all lines and 7 lines after starting with 'build' and containing '.S.obj:' from build/build.ninja
sed -i '/build/,$ {/\.S\.obj:/ {N;N;N;N;N;N;N;d;}}' build/build.ninja

ls build
ls build/kernel/CMakeFiles/kernel.dir/CMakeFiles/

cd build
cmd.exe //C cmake --build . --config Release