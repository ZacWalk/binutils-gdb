#!/bin/bash

. ../../environment.sh # import variables from environment script
set -ex # stop bash script on error

gcc_remote_url=$(git config --get remote.origin.url)
pull_request_id=$(git name-rev --name-only HEAD)
pull_request_id=$(echo $pull_request_id | sed -E "s/remotes\/pull\/([[:digit:]]+)\/.*/\1/")
workspace_folder="~/workspace/$runner_name/PR$pull_request_id"
gcc_build_folder="$workspace_folder/build/binutils-gdb"
gcc_source_folder="$workspace_folder/binutils-gdb"
gmp_object_folder="$workspace_folder/build/gmp"

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    pwd
    [ -d $workspace_folder ] && rm -r $workspace_folder
    mkdir -p $workspace_folder
    cd $workspace_folder
    sudo apt-get update
    sudo apt-get -y install build-essential binutils-for-build texinfo bison flex zlib1g-dev libgmp-dev dejagnu
    git clone ${gcc_remote_url}
    cd binutils-gdb
    git fetch origin pull/$pull_request_id/head:pullrequest
    git checkout pullrequest
    mkdir -p $gcc_build_folder
    cd $gcc_build_folder
    $gcc_source_folder/configure --target=aarch64-pe --prefix="\$HOME/cross"
    make
ENDSSH

git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
git checkout e46521db0

cat ../.github/workflows/patches/gmp-gcc-vcpkg.patch | sed -e "s/^++runner_workspace=/++runner_workspace=\"${workspace_folder//\//\\/}\"/" | git apply --whitespace=fix
./bootstrap-vcpkg.sh

ssh -i $gcc_identity $gcc_destination 'bash -sx' << ENDSSH
    set -e # stop bash script on error
    [ -d $gmp_object_folder ] && rm -r $gmp_object_folder
    mkdir -p $gmp_object_folder
ENDSSH

./vcpkg.exe install gmp:arm64-windows
