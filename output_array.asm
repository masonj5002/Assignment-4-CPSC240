;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Mason Jennings
;  Author email: masonj@csu.fullerton.edu
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

extern printf
global output_array

segment .data
output_header db "IEEE754                              Scientific Decimal", 10, 0
output_row_basic db "0x%016lx", 10, 0
output_row db "0x%016lx                   %18.13g", 10, 0
stringformat db "%s", 0

segment .bss


segment .text
;****Program begins executing here****
output_array:     ;****
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
mov r14, rsi ;address of array
xor r13, r13 ;counter

mov rax, 0
mov rdi, stringformat
mov rsi, output_header
call printf

output_loop:
    ;show the version in decimal...
    mov rax, 0
    mov rdi, output_row
    mov rsi, [r14+8*r13]
    call printf

    inc r13
    cmp r13, r15
    jge loop_end
    jmp output_loop
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