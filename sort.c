//****************************************************************************************************************************
//Program name: "Assignment 4 ~ My Random Number Arrays".  This program teaches the user about both random numbers and       *
//arrays in assembly programming.                                                                                            *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//version 3 as published by the Free Software Foundation.                                                                    *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
//****************************************************************************************************************************
//========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
//Author information
//  Author name: Mason Jennings
//  Author email: masonj@csu.fullerton.edu
//  CWID: 888672672
//
//Program information
// Program name: "Assignment 4 ~ My Random Number Arrays"
//  Programming languages X86 with one module in C++
//
//Project information
//  Files: main.c, executive.asm, fill_random_array.asm, isnan.asm, output_array.asm, sort.asm, r.sh
//  Status: The program has been tested extensively with no detectable errors.
//
//Translator information
//  gcc compiler: gcc -c -fno-pie -no-pie -o sort.o sort.c
//  Gnu linker:   gcc -m64 -o go.out executive.o fill_random_array.o isnan.o output_array.o normalize_array.o sort.o main.o -fno-pie -no-pie
//
//Execution: ./go.out
//
//===== Begin code area ====================================================================================================================================================

int sort(int len, unsigned long int *array) {
    // sort
    for (int i = 0; i < len; i++)
    {
        for (int j = i; j < len; j++)
        {
            if (array[j] < array[i])
            {
                unsigned long int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }

    return 0;
}