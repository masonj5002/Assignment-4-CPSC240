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
random_number_message db "The random number in IEEE is: 0x%016lx", 10, 0
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
;Generate a random number:
rdrand r15

;move the random number into xmm15 by pushing it onto the stack
push r15                    ;rsp will point to r15
movsd xmm15, [rsp]          ;dereference the value in rsp and move it into xmm15
pop rbx                     ;pop to balance the stack (every push must have a pop)

;Print out the random number in IEEE and scientific format
mov rax, 1
mov rdi, random_number_message
mov rsi, r15
movsd xmm0, xmm15
call printf

;conclusion message
mov rax, 0
mov rdi, stringformat
mov rsi, conclusion_message
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