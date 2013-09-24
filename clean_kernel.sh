#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/home/guni/kernel/arm-eabi-google-4.7.0/bin/arm-eabi-

make clean 
rm -rf .config .config.old .version
