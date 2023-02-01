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