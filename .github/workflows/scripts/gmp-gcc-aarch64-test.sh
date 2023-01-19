#!/bin/bash

. ../../environment.sh # import variables from environment script
set -ex # stop bash script on error

gcc_remote_url=$(git config --get remote.origin.url)
rev_reference=$(git name-rev --name-only HEAD)
rev_reference=${rev_reference#remotes/*}
rev_reference_folder_name=${rev_reference//\//-}
workspace_runner_folder="~/workspace/$runner_name"
workspace_folder="$workspace_runner_folder/$rev_reference_folder_name"
gcc_build_folder="$workspace_folder/build/binutils-gdb"
gcc_source_folder="$workspace_folder/binutils-gdb"
gmp_object_folder="$workspace_folder/build/gmp"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    pwd
    [ -d $workspace_folder ] && rm -r $workspace_folder
    find $workspace_runner_folder -mindepth 1 -maxdepth 1 -type d -mmin +600 -exec rm -rf {} \; # clean up session files after 10h
    mkdir -p $workspace_folder
    cd $workspace_folder
    sudo apt-get update
    sudo apt-get -y install build-essential binutils-for-build texinfo bison flex zlib1g-dev libgmp-dev dejagnu libmpfr-dev
    git clone ${gcc_remote_url}
    cd binutils-gdb
    git fetch origin $rev_reference:pullrequest
    git checkout pullrequest
    mkdir -p $gcc_build_folder
    cd $gcc_build_folder
    $gcc_source_folder/configure --target=aarch64-pe --prefix="\$HOME/cross"
    make
ENDSSH

git clone https://github.com/microsoft/vcpkg.git
cd vcpkg

cat ../.github/workflows/patches/gmp-gcc-vcpkg.patch | sed -e "s/^++runner_workspace=/++runner_workspace=\"${workspace_folder//\//\\/}\"/" | git apply --whitespace=fix
./bootstrap-vcpkg.sh

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $gmp_object_folder ] && rm -r $gmp_object_folder
    mkdir -p $gmp_object_folder
ENDSSH

./vcpkg.exe install gmp:arm64-windows
