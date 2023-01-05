#!/bin/bash

set -ex # stop bash script on error

git remote add upstream https://github.com/bminor/binutils-gdb.git
git fetch upstream
git checkout origin/master
git merge upstream/master
git push