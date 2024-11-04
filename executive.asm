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
;  Gnu compiler: nasm -f elf64 -o executive.o executive.asm
;  Gnu linker:   gcc -m64 -o go.out executive.o fill_random_array.o isnan.o output_array.o normalize_array.o sort.o main.o -fno-pie -no-pie
;
;Execution: ./go.out
;
;===== Begin code area ====================================================================================================================================================

extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern fill_random_array
extern output_array
extern normalize_array
extern sort
global executive
max_string_size equ 32
max_int_size equ 32
max_array_size equ 512

segment .data
namemessage db "Please enter your name: ", 0
titlemessage db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc): ", 0
welcomemessage db "Nice to meet you ", 0
intromessage db "This program will generate 64-bit IEEE float numbers.", 10, 0
inputmessage db "How many numbers do you want? Today's limit is 100 per customer: ", 0
input_error_msg db "    You have entered a value outside of the range. Please try again.", 10, 0
outputmessage db "Your numbers have been stored in an array. Here is that array:", 10, 0
normalizemessage db "The array will now be normalized to the rage 1.0 to 2.0. Here is the normalized array:", 10, 0
sortmessage db "The array will new be sorted:", 10, 0
goodbyemessagep1 db "Good bye ", 0
goodbyemessagep2 db ". You are welcome any time.", 10, 0
singlespace db " ", 0
newline db "", 10, 0
stringformat db "%s", 0
intformat db "%d", 0

segment .bss
users_name resb max_string_size
users_title resb max_string_size
numofrands resq max_int_size
array resq max_array_size

segment .text
;****Program begins executing here****
executive:     ;****
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
;PART I ~ INTRODUCTION
;name message
mov rax, 0
mov rdi, stringformat
mov rsi, namemessage
call printf

;obtain name
mov qword rax, 0
mov rdi, users_name
mov rsi, max_string_size
mov rdx, [stdin]
call fgets
;remove newline
mov rax, 0
mov rdi, users_name
call strlen
mov [users_name+rax-1], byte 0

;title message
mov rax, 0
mov rdi, stringformat
mov rsi, titlemessage
call printf

;obtain title
mov qword rax, 0
mov rdi, users_title
mov rsi, max_string_size
mov rdx, [stdin]
call fgets
;remove newline
mov rax, 0
mov rdi, users_title
call strlen
mov [users_title+rax-1], byte 0

;Display Welcome Message
mov rax, 0
mov rdi, stringformat
mov rsi, welcomemessage
call printf ;welome message
mov rax,  0
mov rdi, stringformat
mov rsi, users_title
call printf ;user's title
mov rax, 0
mov rdi, stringformat
mov rsi, singlespace
call printf ; a single space
mov rax, 0
mov rdi, stringformat
mov rsi, users_name
call printf ;user's name
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf ;newline

;newline
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf

;Intro Message
mov rax, 0
mov rdi, stringformat
mov rsi, intromessage
call printf


;PART II ~ RANDOM NUMBER ARRAY
;Input Message
rand_input:
mov rax, 0
mov rdi, stringformat
mov rsi, inputmessage
call printf

;Obtain Value
mov qword rax, 0
mov rdi, intformat
mov rsi, numofrands ;send value to fill_random_array
call scanf

;Check range (0 <= x <= 100)
mov r12, qword[numofrands]
cmp r12, 0
jl input_error
cmp r12, 100
jg input_error
jmp continue

input_error:
    mov rax, 0
    mov rdi, stringformat
    mov rsi, input_error_msg
    call printf
    mov rax, 0
    mov rdi, newline
    call printf
    jmp rand_input

continue:

;call fill_random_array
mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;the actual array (or at least the address of it)
call fill_random_array

;Output Message
mov rax, 0
mov rdi, stringformat
mov rsi, outputmessage
call printf
mov rax, 0
mov rdi, newline
call printf

;call output_array
mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;the address of the actual array
call output_array

;newline
mov rax, 0
mov rdi, newline
call printf

;Normalize and Display Array
mov rax, 0
mov rdi, stringformat
mov rsi, normalizemessage
call printf
mov rax, 0
mov rdi, newline
call printf

mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;the address of the actual array
call normalize_array

mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;address of actual array
call output_array

;newline
mov rax, 0
mov rdi, newline
call printf

;Sort and Display Array
mov rax, 0
mov rdi, stringformat
mov rsi, sortmessage
call printf
mov rax, 0
mov rdi, newline
call printf

mov rax, 0
mov rdi, [numofrands]
mov rsi, array
call sort

mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;address of actual array
call output_array

;newline
mov rax, 0
mov rdi, newline
call printf

;Goodbye message
mov rax, 0
mov rdi, stringformat
mov rsi, goodbyemessagep1
call printf ;"Good bye "
mov rax, 0
mov rdi, stringformat
mov rsi, users_title
call printf
mov rax, 0
mov rdi, stringformat
mov rsi, goodbyemessagep2 ;". You are welcome any time"
call printf

;** Return the string to the calling program
mov rax, qword users_name
push rax
movsd xmm0, [rsp]
pop rax
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