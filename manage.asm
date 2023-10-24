
;Declarations
number_of_cells EQU 8 ;this was changed from 5 ==> 8

extern printf                                               
extern scanf
extern input_array
extern show_array
extern sum_array

global manage

segment .data                
string_format db "%s",0
float_format db "%lf",0
welcome db "welcome",10,0
voltage db "please input voltage ",0
resistance db "please input resistance ",0
seconds db "plese input seconds ",0
current db "please input current ",0
name db "please enter name: ",0
name_out db "hi ",0
outofhere db "answer is: ",0

segment .bss
;align 16
align 64
backup resb 832


segment .text
manage:


push       rbp
mov        rbp, rsp
push	   rbx
push       rcx
push       rdx
push       rsi
push       rdi
push       r8
push       r9
push       r10
push       r11
push       r12
push	   r13 
push       r14
push	   r15 
pushf                 

mov rax,0
mov rdi, string_format
mov rsi, welcome
call printf

mov rax,0
mov rdi, string_format
mov rsi, voltage
call printf

mov rax,0
mov rdi, float_format
mov rsi, rsp
call scanf
mov r15, rsp

mov rax, 0
mov rdi, string_format
mov rsi, resistance
call printf

mov rax, 0
mov rdi, float_format
mov rsi, rsp
call scanf
mov r14, rsp

mov rax, 0
mov rdi, string_format
mov rsi, seconds
call printf

mov rax, 0
mov rdi, float_format
mov rsi, rsp
call scanf
mov r13, rsp

mov rax, 0
mov rdi, string_format
mov rsi, name
call printf

mov rax, 0
mov rdi, float_format
mov rsi, rsp
call scanf
mov r12, rsp

;calculations
movsd xmm15, [r15] ;voltage
movsd xmm14, [r14] ;resistance
movsd xmm13, [r13] ;seconds

movsd xmm12, xmm15 ;copy of V
divsd xmm15, xmm14 ;xmm15 has I
mulsd xmm12, xmm15 ;xmm12 has P
mulsd xmm12, xmm13 ;has w

mov rax, 0
mov rdi, string_format
mov rsi, name_out
call printf

;mov rax, 0
;mov rdi, string_format
;mov rsi, [r12]
;call printf

mov rax,0
mov rdi, string_format
mov rsi, outofhere
call printf

movsd xmm0, xmm12
mov rax,1
mov rdi, float_format
mov rsi, rsp
call printf


popf                                                        
pop        r15                                              
pop        r14                                              
pop        r13                                              
pop        r12                                              
pop        r11                                              
pop        r10                                              
pop        r9                                               
pop        r8                                               
pop        rdi                                              
pop        rsi                                              
pop        rdx                                              
pop        rcx                                              
pop        rbx                                              
pop        rbp                                              


ret