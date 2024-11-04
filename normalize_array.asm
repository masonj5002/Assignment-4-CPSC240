;****************************************************************************************************************************
;Program name: "Assignment 4 ~ My Random Number Arrays".  This program teaches the user about both random numbers and       *
;arrays in assembly programming.                                                                                            *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Mason Jennings
;  Author email: masonj@csu.fullerton.edu
;  CWID: 888672672
;
;Program information
; Program name: "Assignment 4 ~ My Random Number Arrays"
;  Programming languages X86 with one module in C++
;
;Project information
;  Files: main.c, executive.asm, fill_random_array.asm, isnan.asm, output_array.asm, sort.asm, r.sh
;  Status: The program has been tested extensively with no detectable errors.
;
;Translator information
;  Gnu compiler: nasm -f elf64 -o normalize_array.o normalize_array.asm
;  Gnu linker:   gcc -m64 -o go.out executive.o fill_random_array.o isnan.o output_array.o normalize_array.o sort.o main.o -fno-pie -no-pie
;
;Execution: ./go.out
;
;===== Begin code area ====================================================================================================================================================
global normalize_array

segment .data
;empty

segment .bss
;empty

segment .text
;****Program begins executing here****
normalize_array:     ;****
;Back up registers
;PROLOG Backup GPRs (15 pushes)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf
;********Program flow begins here********
mov r15, rdi, ;number of rands
mov r14, rsi  ;address of array
xor r13, r13  ;counter

;normalize the values in the array
;create a loop in order to normalize the values
normailize_loop:
    ;normalize value
    mov rdi, [r14+8*r13]
    mov r12, 0x000FFFFFFFFFFFFF
    and rdi, r12
    mov r11, 0x3FF0000000000000
    or rdi, r11

    ;place into array
    mov [r14+8*r13], rdi

    inc r13
    cmp r13, r15
    jge loop_end
    jmp normailize_loop
loop_end:
;********Program flow ends here**********
;Restore data to the values held before this function was called.
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp
; system stack has returned to initial state
ret
;** End of program **