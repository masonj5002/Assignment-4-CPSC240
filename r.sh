#!/bin/bash

#****************************************************************************************************************************
#Program name: "Assignment 4 ~ My Random Number Arrays".  This program teaches the user about both random numbers and       *
#arrays in assembly programming.                                                                                            *
#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
#version 3 as published by the Free Software Foundation.                                                                    *
#This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
#warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
#A copy of the GNU General Public License v3 is available here:  <https:#www.gnu.org/licenses/>.                           *
#****************************************************************************************************************************
#========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
#Author information
#  Author name: Mason Jennings
#  Author email: masonj@csu.fullerton.edu
#  CWID: 888672672
#
#Program information
# Program name: "Assignment 4 ~ My Random Number Arrays"
#  Programming languages X86 with one module in C++
#========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
echo "Remove old executable/lis files, if there are any"
rm *.out
rm *.lis
rm *.o

echo "Assemble the x86 file executive.asm"
nasm -f elf64 -o executive.o executive.asm

echo "Assemble the x86 file fill_random_array.asm"
nasm -f elf64 -o fill_random_array.o fill_random_array.asm

echo "Assemble the x86 file isnan.asm"
nasm -f elf64 -o isnan.o isnan.asm

echo "Assemble the x86 file output_array.asm"
nasm -f elf64 -o output_array.o output_array.asm

echo "Assemble the x86 file normalize_array.asm"
nasm -f elf64 -o normalize_array.o normalize_array.asm

echo "Compile the 'C' file sort.c"
gcc -c -fno-pie -no-pie -o sort.o sort.c

echo "Compile the 'C' file main.c"
gcc -c -fno-pie -no-pie -o main.o main.c

echo "Link the NASM and 'C' files"
gcc -m64 -o go.out executive.o fill_random_array.o isnan.o output_array.o normalize_array.o sort.o main.o -fno-pie -no-pie

echo "Next, the program will run:
*********************************************************
"

chmod +x main.o
./go.out