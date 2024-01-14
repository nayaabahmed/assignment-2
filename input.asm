section .data
    prompt db 'Enter a character: $'
    newline db 13, 10, '$'

section .bss
    stack resb 10 ; Stack to store characters
    top_of_stack resb 1 ; Top of the stack pointer

section .text
    org 0x100

_start:
    mov cx, 10 ; Loop counter

input_loop:
    ; Print prompt
    mov ah, 9 ; DOS function for printing string
    lea dx, [prompt]
    int 0x21

    ; Read a character from the user
    mov ah, 1 ; DOS function for reading character
    int 0x21
    mov [si], al ; Store the character in the stack
    inc si ; Move the stack pointer

    ; Decrement the loop counter
    loop input_loop

    ; Print characters in reverse order
    mov cx, 10 ; Loop counter
    mov si, 10 ; Reset stack pointer

print_loop:
    ; Pop a character from the stack
    dec si
    mov al, [si]

    ; Print the character
    mov ah, 2 ; DOS function for printing character
    int 0x21

    ; Print a newline after each character
    mov ah, 9 ; DOS function for printing string
    lea dx, [newline]
    int 0x21

    ; Decrement the loop counter
    loop print_loop

    ; Exit the program
    mov ah, 4Ch ; DOS function for program termination
    int 0x21
