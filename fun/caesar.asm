section .data 
    GETSTD_READ dq -10 
    GETSTD_OUT dq -11 
    answer db "HAHAHAHAHAHAHAHAHAHA"
    bad_answer db "wrong"
    nice_answer db "correct"
    enter_password db "Enter my password: "
section .bss
    buffer resb 20 
    written_to_buffer resb 20

section .text
    extern ReadFile,WriteFile,ExitProcess
    extern GetStdHandle
    global main

main:  

    mov rcx ,[rel GETSTD_OUT]
    call GetStdHandle    
    mov [rel GETSTD_OUT],rax

    mov rcx ,[rel GETSTD_READ ]
    call GetStdHandle   
    mov [rel GETSTD_READ] , rax     

    mov rcx , [rel GETSTD_OUT]
    lea rdx , [rel enter_password]
    mov r8 , 19
    mov r9 , 0 
    call WriteFile

    mov rcx, [rel GETSTD_READ]          
    lea rdx ,[rel buffer] 
    mov r8 , 20
    lea r9 , [rel written_to_buffer]
    call ReadFile


    lea rdx , [rel answer]
    lea r9 ,[rel buffer]
    mov rcx , 20 
    compare : 
        movzx rax , byte [rdx]
        add al , 10
        movzx r8 , byte [r9]
        cmp rax,r8
        jne bad
        inc rdx
        inc r9
    loop compare

    
    mov rcx, [rel GETSTD_OUT]
    lea rdx ,[rel nice_answer] 
    mov r8 , 7
    call WriteFile
    call ExitProcess

bad :
    mov rcx, [rel GETSTD_OUT]
    lea rdx ,[rel bad_answer] 
    mov r8 , 5
    call WriteFile
    call ExitProcess 
        
