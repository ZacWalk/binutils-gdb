#!/bin/bash

set -ex # stop bash script on error
. .github/workflows/scripts/base.sh

openblas_folder="$workspace_folder/build/openblas/"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $openblas_folder ] && rm -r $openblas_folder
    [ -d openblas ] && rm -r openblas
    mkdir -p $openblas_folder
ENDSSH


scp -i $gcc_identity -r ./openblas/ $gcc_destination:$openblas_folder

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    
    cd $openblas_folder/openblas

    root_dir=\$(pwd)
    echo \$root_dir

    # copy config.h from build/ to root
    cp build/config.h .

    # read specific line from file into variable
    line=\$(sed -n '/include/=' build/kernel/CMakeFiles/camax_k.S)
    path_to_replace=\$(sed -n "\${line}p" build/kernel/CMakeFiles/camax_k.S)
    echo \$path_to_replace
    echo \$line

    #remove prefix '#include ' from path_to_replace
    path_to_replace=\${path_to_replace#'#include "'}

    #remove suffix 'zamax.S' from path_to_replace
    path_to_replace=\${path_to_replace%'zamax.S"'}

    #find path_to_replace in all .S files in build/kernel/CMakeFiles folder and replace it with base path
    find ./build/kernel/CMakeFiles -name "*.S" -exec sed -i "s|\$path_to_replace|\$root_dir/kernel/arm64/|g" {} \;

    mkdir -p ./build/gas

    for file in ./build/kernel/CMakeFiles/*.S; do
        gcc -I\$root_dir -E \$root_dir/build/kernel/CMakeFiles/\$(basename \$file) > \$root_dir/build/gas/\$(basename \$file .S).s;
        $gcc_build_folder/gas/as-new \$root_dir/build/gas/\$(basename \$file .S).s -o \$root_dir/build/gas/\$(basename \$file .S).S.obj;
    done
    rm ./build/gas/*.s
ENDSSH

scp -i $gcc_identity -r $gcc_destination:$openblas_folder/openblas/build/gas/ ./openblas/build/kernel/CMakeFiles/kernel.dir/CMakeFiles/

cp ./openblas/build/kernel/CMakeFiles/kernel.dir/CMakeFiles/gas/*.S.obj ./openblas/build/kernel/CMakeFiles/kernel.dir/CMakeFiles/
rm -r ./openblas/build/kernel/CMakeFiles/kernel.dir/CMakeFiles/gas

cd ./openblas

#remove all lines and 7 lines after starting with 'build' and containing '.S.obj:' from build/build.ninja
sed -i '/build/,$ {/\.S\.obj:/ {N;N;N;N;N;N;N;d;}}' build/build.ninja

cd build
cmd.exe //C cmake --build . --config Release
cmd.exe //C ctest
./utest/openblas_utest.exe