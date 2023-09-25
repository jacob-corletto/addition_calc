extern printf                                               

extern scanf                                                


global sum_array

segment .data 
int_form db "%lf",10,0  
float_form db "%lf"             

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

;push qword 0
mov r14, rdi				;the array start point
mov r15, rsi                ;the size of array

;looping part
mov r13,0 					;the counter
;mov r11,1
movsd xmm0,xmm15

begin: 
cmp r13,r15
jge loop_finished

movsd xmm14, [r14+8*r13]
addsd xmm15, xmm14
inc r13
jmp begin

;=============================old way
;mov rax,0
;mov rdi,float_form
;mov rsi,r13
;mov r12,r13
;shl r12,3					;fast mult by 8
;add r12,r13
;mov rdx,r12
;movsd xmm0, [r14+8*r13]
;mov rcx,[r14+8*r13]
;call printf
;addsd xmm0, [r14+8*r11]
;movsd xmm15,xmm0
;inc r13
;jmp begin
;=============================old way

loop_finished:

;push qword 0
movsd [rsp], xmm15
;Xrstor
movsd xmm0, [rsp]
;pop rax

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