extern printf                                               

global show_array

segment .data 

dataline db "%lf",10,0

segment .text
show_array:

push       rbp                                              
mov        rbp, rsp                                         
push       rbx                                              
push       rcx                                              
push       rdx                                              
push       rsi                                              
push       rdi                                              
push       r8                                               
push       r9                                               
push       r10                                              
push       r11                                              
push       r12                                              
push       r13                                              
push       r14                                              
push       r15                                              
pushf  

mov r14, rdi				;the array start point
mov r15, rsi                ;the size of array

;print frist 

;looping part
mov r13,0 					;the counter

begin: 
cmp r13,r15
jge loop_finished
mov rax,1
mov rdi,dataline
;mov rsi,[r14+8*r13]
mov rsi,r13
mov r12,r13
shl r12,3					;fast mult by 8
add r12,r13
mov rdx,r12
movsd xmm0, [r14+8*r13]
mov rcx,[r14+8*r13]
call printf
inc r13
jmp begin

loop_finished:
xor rax, rax

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