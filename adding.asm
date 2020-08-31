
extern printf

section .data
    
    num1 dq  50
    num2  dq 10
    sum db "The sum is: ",0
    subs db "the sub is: ",0
    fmt db "The numbers to calc is: %ld , %ld",10,0
    fmtint db "%s %ld",10,0

section .bss
    result resq 2

section .text

    global main

main:
    call _print_numero1
    call _add
    call _sub
    
    mov rax,60
    mov rdi,0
    syscall

_print_numero1:
    mov rdi,fmt
    mov rsi,[num1]
    mov rdx,[num2]
    mov rax,0
    call printf
    ret


_add:
    mov rax,[num1]
    add rax,[num2]
    mov [result],rax
    mov rdi,fmtint
    mov rsi,sumaddin
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

