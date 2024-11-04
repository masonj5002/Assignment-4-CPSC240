;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Mason Jennings
;  Author email: masonj@csu.fullerton.edu
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
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