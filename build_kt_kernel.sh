#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/home/guni/kernel/arm-eabi-4.7/bin/arm-eabi-

make c1kt_00_defconfig 
make -j4

find . -name "*.ko" | xargs cp -t modules
