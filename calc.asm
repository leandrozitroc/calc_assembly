extern printf

section .data
    
    num1 db "Input number1: ",0
    num2 db "input number2: ",0
    ;num2  dq 10
    sum db "The sum is: ",0
    subs db "the sub is: ",0
    fmt db "The numbers to calc is: %ld , %ld",10,0
    fmtint db "%s %ld",10,0

section .bss
    result resq 2
    number1 resq 2
    number2 resq 2
section .text

    global main

main:
    call _get_number1
    call _get_number2
    call _print_numero1
    call _add
    call _sub
    
    mov rax,60
    mov rdi,0
    syscall

_get_number1:
    mov rax,0
    mov rdi,0
    mov rsi,number1
    mov rdx,3
    syscall
    ret

_get_number2:
    mov rax,0
    mov rdi,0
    mov rsi,number2
    mov rdx, 3
    syscall
    ret

_print_numero1:
    mov rdi,fmt
    mov rsi,number1
    mov rdx,number2
    mov rax,0
    call printf
    ret


_add:
    mov rax,[number1]
    add rax,[number2]
    mov [result],rax
    mov rdi,fmtint
    mov rsi,sum
    mov rdx,[result]
    call printf
    syscall
    ret

_sub:
    mov rax,[num1]
    sub rax,[num2]
    mov [result],rax
    mov rdi,fmtint
    mov rsi,subs
    mov rdx,[result]
    call printf
    syscall
    ret

