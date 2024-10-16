global _start 
section .rodata 
    degree equ 7
    number equ 2 
section .text 
    _start :
      mov rax , number; инит 
      mov rcx  ,degree -1 ; степень 
      mov r9 , number ; число 
      cmp rcx,1 
      jc end
      construction2degree : 
        mul r9
        loop construction2degree
      jmp end 
end : 
    mov rdi , rax
    mov rax , 60 
    syscall
        
