;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;Author information
;  Author name: Mason Jennings
;  Author email: masonj@csu.fullerton.edu
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

extern printf
extern scanf
extern fgets
extern stdin
extern strlen
extern fill_random_array
extern output_array
extern normalize_array
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
outputmessage db "Your numbers have been stored in an array. Here is that array:", 10, 0

random_number_message db "The random number is: 0X%016lx , %-18.13g", 10, 0 ;TEMP FOR DEBUGGING -- DELETE WHEN FINISHED
goodbyemessagep1 db "Good bye ", 0
goodbyemessagep2 db ". You are welcome any time.", 10, 0
singlespace db " ", 0 ; a single space
newline db "", 10, 0 ; a newline
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
;name message
;mov rax, 0
;mov rdi, stringformat
;mov rsi, namemessage
;call printf

;obtain name
;mov qword rax, 0
;mov rdi, users_name
;mov rsi, max_string_size
;mov rdx, [stdin]
;call fgets
;remove newline
;mov rax, 0
;mov rdi, users_name
;call strlen
;mov [users_name+rax-1], byte 0

;title message
;mov rax, 0
;mov rdi, stringformat
;mov rsi, titlemessage
;call printf

;obtain title
;mov qword rax, 0
;mov rdi, users_title
;mov rsi, max_string_size
;mov rdx, [stdin]
;call fgets
;remove newline
;mov rax, 0
;mov rdi, users_title
;call strlen
;mov [users_title+rax-1], byte 0

;Display Welcome Message
;mov rax, 0
;mov rdi, stringformat
;mov rsi, welcomemessage
;call printf ;welome message
;mov rax,  0
;mov rdi, stringformat
;mov rsi, users_title
;call printf ;user's title
;mov rax, 0
;mov rdi, stringformat
;mov rsi, singlespace
;call printf ; a single space
;mov rax, 0
;mov rdi, stringformat
;mov rsi, users_name
;call printf ;user's name
;mov rax, 0
;mov rdi, stringformat
;mov rsi, newline
;call printf ;newline

;newline
;mov rax, 0
;mov rdi, stringformat
;mov rsi, newline
;call printf

;Intro Message
;mov rax, 0
;mov rdi, stringformat
;mov rsi, intromessage
;call printf

;Input Message
mov rax, 0
mov rdi, stringformat
mov rsi, inputmessage
call printf

;Obtain Value
mov qword rax, 0
mov rdi, intformat
mov rsi, numofrands ;send value to fill_random_array
call scanf

;later -- provide input validation for INPUT

;call fill_random_array -- ********************************************************************************************************************
mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;the actual array (or at least the address of it)
call fill_random_array ;***

;Output Message
mov rax, 0
mov rdi, stringformat
mov rsi, outputmessage
call printf
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf

;DEBUGGING SHOW ARRAY HERE
;mov rax, 0
;mov rdi, random_number_message
;mov rsi, [array] ;prints first value
;call printf

;call output_array (displays only -- does not create) ************************************************************************************
mov rax, 0
mov rdi, [numofrands]
mov rsi, array ;the address of the actual array
call output_array

;newline
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf

;Normalize and Display Array
mov rax, 0
call normalize_array

;Sort and Display Array

;newline
mov rax, 0
mov rdi, stringformat
mov rsi, newline
call printf
;Goodbye message
mov rax, 0
mov rdi, stringformat
mov rsi, goodbyemessagep1
call printf ;"Good bye "
mov rax, 0
mov rdi, stringformat
mov rsi, users_title
call printf ;User's Title
mov rax, 0
mov rdi, stringformat
mov rsi, goodbyemessagep2 ;". You are welcome any time"
call printf

;** Return the string, that is now stored in a named constant, to the calling program ** (From Holliday) (Requried to prevent segfault)
mov rax, qword users_name               ;Put a copy of users_name in xmm0
push rax                                ;Now users_name is on top of the stack
movsd xmm0, [rsp]                       ;Now there is a copy of 3.5 in xmm0
pop rax                                 ;Return the stack to its former state
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