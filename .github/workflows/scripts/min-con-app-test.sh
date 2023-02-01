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
scp -i $gcc_identity $gcc_destination:$min_con_app_folder/con-app-aarch64.o ./research/

cd ./research/

LINK.exe con-app-aarch64.o kernel32.Lib /SUBSYSTEM:CONSOLE

./con-app-aarch64.exe

powershell.exe ../.github/workflows/scripts/assert-min-con-app.ps1