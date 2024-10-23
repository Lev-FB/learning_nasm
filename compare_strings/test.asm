global    _start
section   .data
char dd 123,32,14,123,4212,412,412    ; первый массив
char_len equ  ($ - char)/4
char2 dd 123,32,14,123,4212,412,41,43 ; второй массив
char2len equ ($ - char2) / 4
section   .text
_start:
        mov rax , char2len
        mov rdx , char_len
        cmp rax, rdx 
        jne  end       

        lea rdi, [rel char]
        lea rsi, [rel char2]
        mov rcx, char_len  
        repe cmpsd  
        
       
        mov r9, 2    ; Если массивы совпадают
        mov r10, 1   ; Если массивы не совпадают
        
        cmovz rdi, r9    
        cmovnz rdi, r10  ; 
        
        mov  rax, 0x02000001 
        syscall              

end:
        mov rdi, 3
        mov rax, 0x02000001 
        syscall
