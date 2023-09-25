
;Declarations
number_of_cells EQU 8 ;this was changed from 5 ==> 8

extern printf                                               
extern scanf
extern input_array
extern show_array
extern sum_array

global manage

segment .data                
intro db "We will take care of all your array needs.",10,0

enter_numbers db "Please input float numbers separated by ws.  After the last number press ws followed by control-d.",10,0

;go to input_array

display_numbers_message db "Thank you.  The numbers in the array are",10,0

display_sum db "The sum of numbers in the array is %lf",10,0

exit_msg db "Thank you for using Array Management System.",10,0

;test db "this is a test %1.6lf",10,0

stringformat db "%s",0

eight_byte_format db "%lf", 0

array_address db "The address of the array plywood is %016lx",10,0

segment .bss
;align 16
array resq number_of_cells

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

mov rax, 0
mov rdi, stringformat
mov rsi, intro
call printf

mov rax, 0
mov rdi, stringformat
mov rsi, enter_numbers
call printf

mov rax,0
mov rdi, array
mov rsi, number_of_cells
call input_array
mov r13, rax

mov rax, 0
mov rdi, stringformat
mov rsi, display_numbers_message
call printf

;output time (time to output)
mov rax, 0
mov rdi, array
mov rsi, r13
call show_array

;sum array time
mov rax, 0
mov rdi, array
mov rsi, r13
call sum_array

mov rax,1
mov rdi, display_sum
call printf

mov rax, 0
mov rdi, stringformat
mov rsi, exit_msg
call printf

push qword 0
movsd [rsp], xmm15
;Xrstor
movsd xmm0, [rsp]
pop rax


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