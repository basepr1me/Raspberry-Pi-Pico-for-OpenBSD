#!/bin/ksh
clear
printf "\nBuilding project...\n\n";

cd build
cmake -DPICO_TOOLCHAIN_PATH=/usr/local/arm-none-eabi/bin ..
make

printf "\nFiles built:\n\n"
ls -lah .

printf "\nDone\n\n";
