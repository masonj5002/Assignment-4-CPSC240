#!/bin/bash

# Author Information
#   Mason Jennings
#   masonj@csu.fullerton.edu

echo "Remove old elecutable/lis files, if there are any"
rm *.out
rm *.lis
rm *.o

echo "Assemble the x86 file executive.asm"
nasm -f elf64 -o executive.o executive.asm

echo "Assemble the x86 file fill_random_array.asm"
nasm -f elf64 -o fill_random_array.o fill_random_array.asm

echo "Assemble the x86 file output_array.asm"
nasm -f elf64 -o output_array.o output_array.asm

echo "Compile the 'C' file main.c"
gcc -c -fno-pie -no-pie -o main.o main.c

echo "Link the NASM and 'C' files"
gcc -m64 -o go.out executive.o fill_random_array.o output_array.o main.o -fno-pie -no-pie

echo "Next, the program will run:
*********************************************************
"

chmod +x main.o
./go.out