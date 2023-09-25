extern printf                                               

extern scanf                                                


global input_array

segment .data                 
eight_byte_format db "%lf", 0
integer_format db "%ld",0
string_format db "%s", 0
test2 db "I loaded in the r13 n r14",10,0
arrayaddressmessage db "The first element of the array is located at 0x%016lx in the stack space",10,0
maxarray db "the max number is %1ld",10,0
count_message db "You have entered %1ld floating point numbers.",0
dataline db "%3ld   0x%016lx   %16.8lf   0x%016lx",0
two_extra_numbers db "%1.6lf %1.6lf",0

segment .bss
;align 16

segment .text
input_array:


push rbp                        
mov  rbp, rsp
;push rbx
;push rcx
;push rdx
;push rsi
;push rdi
;push r8
;push r9
;push r10
;push r11
;push r12
;push r13
;push r14
;push r15

;pushf



;push qword 0

mov        r14, rdi ;rdi is the array
mov        r15, rsi ;R15 is the upper limit of the elements of the array
mov r13, 0

;push qword 0
;mov rax, 0
;mov rdi, maxarray
;mov rsi, r13
;call scanf
;pop r8

;loop in the array
jmp begin
begin: 
    cmp r13,r15
    jge loop_finished
    ;je input_array
    mov rax, 0
    mov rdi, eight_byte_format ;"%lf"
    ;push qword 0
    mov rsi, rsp
    call scanf

    cdqe ; -1111111...
    cmp rax,-1
    je loop_finished

    ;movsd xmm15, [rsp]
    ;pop rax
    mov rax, [rsp]
    mov [r14+r13*8], rax
    ;movsd [r14 + r13 * 8], xmm15
    inc r13
    jmp begin

loop_finished:

    ;pop r8
    mov rax, r13
    ;pop rax

;push qword 0
;mov rax, 0
;mov rdi, maxarray
;mov rsi, r13
;call printf
;pop r8

;push qword 0
;mov rax, 0
;mov rdi, maxarray
;mov rsi, rax
;call printf
;pop r8



;popf                                    ;Restore rflags
;pop r15                                 ;Restore r15
;pop r14                                 ;Restore r14
;pop r13                                 ;Restore r13
;pop r12                                 ;Restore r12
;pop r11                                 ;Restore r11
;pop r10                                 ;Restore r10
;pop r9                                  ;Restore r9
;pop r8                                  ;Restore r8
;pop rdi                                 ;Restore rdi
;pop rsi                                 ;Restore rsi
;pop rdx                                 ;Restore rdx
;pop rcx                                 ;Restore rcx
;pop rbx                                 ;Restore rbx
pop rbp                                 ;Restore rbp

ret                                     ;Pop the integer stack and jump to the address equal to the popped value.