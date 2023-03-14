#!/bin/bash

set -ex # stop bash script on error
. .github/workflows/scripts/base.sh

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
    if [ ! -z "$ci_merge_with_branch" ]; then
        git fetch origin $ci_merge_with_branch:$ci_merge_with_branch
        git merge $ci_merge_with_branch --no-commit
    fi
    mkdir -p $gcc_build_folder
    cd $gcc_build_folder
    $gcc_source_folder/configure --target=aarch64-pe --prefix="\$HOME/cross"
    make -j\$(nproc)
ENDSSH
