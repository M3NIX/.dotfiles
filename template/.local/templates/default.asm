section .data

result_string: db "Result: %d", 0xa, 0

section .bss
result: resb 4

section .text

global main
; tell NASM that printf is a symbol defined in another module
extern printf

main:
    ; ----- YOUR CODE GOES BELOW THIS LINE -----
    mov eax, 5
  
 
    ; ----- END OF YOUR MODIFICATIONS -----
 
    ; Store result
    mov [result], eax
 
    ; Print result
    push dword [result]
    push result_string
    call printf

    ; Calling convention requires us to cleanup stack
    add esp, 8
    
    ret
