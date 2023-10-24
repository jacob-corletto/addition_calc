#!/bin/bash


#Author: Floyd Holliday
#Program name: Basic Float Operations

rm *.o
rm *.out

nasm -f elf64 -l manage.lis -g -o manage.o manage.asm

g++ -c -m64 -Wall -g -o main-driver.o main.c -fno-pie -no-pie -std=c++20

g++ -m64 -g -o run.out manage.o main-driver.o -fno-pie -no-pie -std=c++20

./run.out
