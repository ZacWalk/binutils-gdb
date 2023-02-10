#!/bin/bash

set -ex # stop bash script on error

git clone --depth 1 https://github.com/xianyi/OpenBLAS.git openblas
cd openblas
sed -i '143,145d' ./common_arm64.h 
mkdir build