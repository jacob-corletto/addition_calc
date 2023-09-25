# Project 2
## Baseline software requirements

### Driver
* The driver module is written in C language. Among the posted programs at the class website there are examples showing how to compile a main written in C.

### Manage.asm
* In the manage function declare a constant 8, which will be the size of the array used in this program. Yes, there is exactly one array of size 8 cells and each cell is a qword.
* [The size of the array is intentionally set to the small number 8 so that testing for array overflow
is easier.]
* In the manage function the array has a name. In all the other functions that name is unknown.
* The other functions will know the array as an unsigned long int number.
* The manage function calls input_array and passes to input_array the array and the max number 8.

### Input Array
* Input array makes a loop. Numbers are read from the keyboard and placed into the array. The looping stops when either of two events happen: 8 numbers have been placed into the array or
the user has entered control-d as a signal that there are no more inputs.
* When the loop stops the the input_array function returns to the caller the number of values placed into the array. The return number is an integer between 0 and max=8 inclusive.

### Output array
* When input_array terminates then manage calls output_array, which shows all the numbers in the array.
* When output_array is terminated then manage calls sum_array.

### Sum array
* sum_array does not output any data to the monitor (stdout).
* sum_array adds all the numbers in the array and sends that
number to manage.
* manage outputs the sum of number to stdout.
* Lastly, the manage function displays a farewell message thanking the user for choosing this

### program to view important data
* In the baseline version the manage function simply returns a sum of numbers in the array to the
driver.
* The driver has no idea what that number represents, but it decides to keep it.
* We will unrealistically assume that all users behave properly and never try to crash someone else’s program. Therefore, validation of inputs is postponed until a future assignment.
* In any assembly function do not declare single value variable in segments .data or .bss. In
assignment 1 you declare the float number “distance2vegas dq 353.5” , but that was a constant.
* The rule here says ‘Do not declare named scalar variables ever.” Do not act like a
C++ programmer when you’re writing assembly code.

## Baseline sample dialog between user and this programs
> - Welcome to Array Management System 
> - This product is maintained by Your Name at yourname@csu.fullerton.edu
> - We will take care of all your array needs.
> - Please input float numbers separated by ws. After the last number press ws followed by
control-d.
>- -5.4 24.96 -0.09 100.0 <control d>
>- Thank you. The numbers in the array are:
> - -5.4790000000
>- 24.9800000000
> - 0.0900000000
> - 100.0000000000
> - The sum of numbers in the array is 118.7000000000 <==Not mathematically correct.
> - Thank you for using Array Management System.
> - The main function received 118.700000000 and will keep it for a while.
> - Please consider buying more software from our suite of commercial program.
> - A zero will be returned to the operating system. Bye

Color codes
main: green
manage: pink
input_array: orange
output_array: blue

Output array always outputs 10 digits on the right of the decimal point.
Remember that 8 is the number of cells in the array. If the user inputs 8 numbers then the loop
in input_array will stop looping because the array is full. In this case there is no control d.