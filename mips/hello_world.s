# This example MIPS program performs the traditional "hello-world" example.
# 
# 
#   1. the variable str is placed into to .data segment
#   1. the variable str is initialized with "Hello World\n"
#   1. the subroutine "main" is placed into the .text segment
#   1. the subroutine "main" performs the following steps
#      - load the lval of str (i.e., its address) into a0
#      - load the value 4 into v0 with 
#      - trap to the kernel requesting Service #17

                .data
str:            .asciiz "Hello World\n" # H,e,l,l,o, ,W,o,r,l,d,\n,\0

                .text
                .globl main

main:           nop
                la $a0, str     # load the lval (i.e., the address) into a0
                li $v0, 4       # Service #4: print string
                syscall         

                li $a0, 0       # a0 contains the return value        
                li $v0, 17      # Service #17: exit with a value
                syscall         
        
        



        
