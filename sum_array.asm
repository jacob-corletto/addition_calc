extern printf                                               

extern scanf                                                


global sum_array

segment .data 
int_form db "%lf",10,0  
float_form db "%lf"  

segment .bss
align 64
backup resb 832           

segment .text
sum_array:

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

;xsave & backup not included messed with the xmm0 register
;mov rax,7
;mov rdx,0
;xsave [backup]                  

mov r14, rdi	;the array start point
mov r15, rsi    ;the size of array

mov r13,0 	;the counter
movsd xmm0,xmm15

;looping part
begin: 
cmp r13,r15
jge loop_finished

movsd xmm14, [r14+8*r13]
addsd xmm15, xmm14
inc r13
jmp begin

loop_finished:

movsd [rsp], xmm15

;mov rax, 7
;mov rdx, 0
;xrstor [backup]

movsd xmm0, [rsp]

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