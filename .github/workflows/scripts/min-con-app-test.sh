#!/bin/bash

set -ex # stop bash script on error
. .github/workflows/scripts/base.sh

minconapp_object_folder="$workspace_folder/build/min-con-app"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $minconapp_object_folder ] && rm -r $minconapp_object_folder
    mkdir -p $minconapp_object_folder
ENDSSH

git clone https://github.com/Windows-on-ARM-Experiments/research.git

scp -i $gcc_identity ./research/min-exe/con-app-aarch64.s $gcc_destination:$minconapp_object_folder
ssh -i $gcc_identity $gcc_destination "$gcc_build_folder/gas/as-new -o $minconapp_object_folder/con-app-aarch64.o $minconapp_object_folder/con-app-aarch64.s"
scp -i $gcc_identity $gcc_destination:$minconapp_object_folder/con-app-aarch64.o ./research/

cd ./research/

research_dir=$(pwd)

cd "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC"
cd $(ls -d */|tail -n 1)
cd ./bin/Hostarm64/arm64/
link_exe_path=$(pwd)/link.exe

cd "C:\Program Files (x86)\Windows Kits\10\Lib"
cd $(ls -d */|tail -n 1)
cd ./um/arm64/
kernel32_path=$(pwd)/kernel32.Lib

cd $research_dir

"$link_exe_path" con-app-aarch64.o "$kernel32_path" /SUBSYSTEM:CONSOLE

./con-app-aarch64.exe

powershell.exe ../.github/workflows/scripts/assert-min-con-app.ps1