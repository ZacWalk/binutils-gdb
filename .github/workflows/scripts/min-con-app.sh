#!/bin/bash

set -ex # stop bash script on error

min_con_app_folder="$workspace_folder/build/min-con-app"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $min_con_app_folder ] && rm -r $min_con_app_folder
    mkdir -p $min_con_app_folder
ENDSSH

git clone https://github.com/Windows-on-ARM-Experiments/research.git

scp -i $gcc_identity ./research/min-exe/con-app-aarch64.s $gcc_destination:$min_con_app_folder
ssh -i $gcc_identity $gcc_destination "$gcc_build_folder/gas/as-new -o $min_con_app_folder/con-app-aarch64.o $min_con_app_folder/con-app-aarch64.s"
scp -i $gcc_identity $gcc_destination:$min_con_app_folder/con-app-aarch64.o ./research/

cd ./research/
LINK.exe con-app-aarch64.o kernel32.Lib /SUBSYSTEM:CONSOLE