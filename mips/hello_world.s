# This example MIPS program performs the traditional "hello-world" example.
# 
# 
#   1. the variable str is placed into to .data segment
#   1. the variable str is initialized with "Hello World\n"
#   1. the subroutine "main" is placed into the .text segment
#   1. the subroutine "main" performs the same operations but without the use of macros
#      - system call #4 is used to print the string
#      - system call #17 is used to exit the program with a value

                .data
str:            .asciiz "Hello World\n" # H,e,l,l,o, ,W,o,r,l,d,\n,\0

                .text
                .globl main

main:           nop
                la $a0, str     # a0 contains the address of str
                li $v0, 4       # v0 contains the number for print_s, 4
                syscall         # trap: print_s(str)

                li $a0, 0       # a0 contains the return value        
                li $v0, 17      # v0 contains the number for exiti, 17
                syscall         # trap: exit
        
        



        
