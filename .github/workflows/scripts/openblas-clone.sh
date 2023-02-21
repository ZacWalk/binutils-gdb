#!/bin/bash

set -ex # stop bash script on error

git clone https://github.com/xianyi/OpenBLAS.git openblas
cd openblas
git checkout 10be02c89605334b3095c0ac76f4aa328ae54f72
sed -i '143,145d' ./common_arm64.h 
mkdir build