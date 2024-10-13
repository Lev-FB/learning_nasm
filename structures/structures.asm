section .data
tab db 0b00001010

cars :
    db "Pagani-1 ","f211 ","1240000$ "
    db "bmw      ","m5   ","1240000$ "
    db "Pagani-3 ","f213 ","1240000$ "
    db "Pagani-4 ","f214 ","1240000$ "
    db "Pagani-5 ","f215 ","1240000$ "
    db "Pagani-6 ","f216 ","1240000$ "
    db "Pagani-7 ","f217 ","1240000$ "
count equ (($ - cars )/3)/8+1


global_car_offset equ 23
model_car_offset equ 9
model_cost_offset equ model_car_offset+5
section .text    
    global _start
_start:
    mov rcx,count ;Помещаем 6 
    mov r9 , 0
    each2console :
    cmp r9,count 
    jz _end
    mov rax ,global_car_offset
    mul r9
    add rax , cars
    mov r10 ,rax
    mov rsi , rax
    mov rax , 1
    mov rdi, 1 
    mov rdx , 9
    syscall

    add r10,model_car_offset
    mov rsi,r10
    mov rdi,1 
    mov rdx, 5 
    mov rax ,1 
    syscall
    sub r10,model_car_offset

    add r10,model_cost_offset 
    mov rsi , r10
    mov rdi , 1 
    mov rax  ,1 
    mov rdx , 9
    syscall

    mov rsi,tab
    mov rdi , 1 
    mov rax  ,1 
    mov rdx , 1
    syscall
    inc r9
    loop each2console 
_end :
    mov rax, 60
    mov rdi, count
    syscall
