;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Mason Jennings
;  Author email: masonj@csu.fullerton.edu
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

extern printf
extern rdrand
global fill_random_array

segment .data
conclusion_message db "The program has finished. Hello from fill_random_array!", 10, 0
random_number_message db "The random number is: 0X%016lx , %-18.13g", 10, 0
newline db "", 10, 0
stringformat db "%s", 0

segment .bss

segment .text
;****Program begins executing here****
fill_random_array:     ;****
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
mov r15, rdi ;number of rands
mov r14, rsi ;the address of the array
xor r13, r13 ;counter

;place [r14 # of values of] random numbers in array
input_loop:
    ; Generate random value
    rdrand rbx

    ;printf the random value
    mov rax, 0
    mov rdi, random_number_message
    mov rsi, rbx
    call printf

    mov [r14+r13*8], rbx
    
    inc r13
    cmp r13, r15
    jge loop_end
    jmp input_loop
loop_end:

;debugging output
;printf the first output
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf

mov rax, 0
mov rdi, random_number_message
mov rsi, [r14+792]
call printf

;newline deleteme
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf

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