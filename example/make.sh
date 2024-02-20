#!/bin/ksh
clear
printf "\nRUNNING THIS WILL DESTROY YOUR BUILD DIRECTORY!!!"
printf "\nDo you wish to proceed? [Y|n]: "

read proceed

if [[ $proceed != "y" && $proceed != "Y" && $proceed != "" ]]; then
	printf "\nExitting!\n"
	exit
fi

printf "\nBuilding project...\n\n";

rm -rf build
mkdir build && cd build
cmake -DPICO_TOOLCHAIN_PATH=/usr/local/arm-none-eabi/bin ..
make

printf "\nFiles built:\n\n"
ls -lah .

printf "\nDone\n\n";
