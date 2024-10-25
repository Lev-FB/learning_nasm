global    _start
section .data 
        first_message db "Enter number :"
        second_message db "Enter second number :"
        result dq 0
section   .bss 
        buffer resq 1

section  .text
_start:
        mov rax ,0x02000004
        lea rsi , [rel first_message]
        mov rdx, 14
        syscall

        mov rdi,0
        lea rsi,[rel buffer]
        mov rdx , 64
        mov  rax, 0x02000003
        syscall
        
        mov rax , [rel buffer]
        sub rax , 48
        mov [rel result], rax 

        mov rax ,0x02000004
        lea rsi , [rel second_message]
        mov rdx, 21
        syscall

        mov rdi,0
        lea rsi,[rel buffer]
        mov rdx , 64
        mov  rax, 0x02000003
        syscall
        
        mov rax , [rel buffer]
        sub rax , 48
        add [rel result], rax 

        mov rdi ,[rel result]
        mov  rax, 0x02000001 
        syscall
