# This example MIPS program performs the traditional "no-op" process.
#
# Simply put, it exercises the following operations
#   1. a process is created within the MIPS environment
#   1. a call is made to the main subroutine
#   1. the exit syscall is explicitly invoked
#   1. the process is then shutdown
#
# To run the program from the command line
#   $ mars empty.s
#
                .data           
                # insert your data declarations
        
                .text           
                # insert your code declarations
        
                .globl main     
                # define your default starting routine
        
main:           nop             # label for the main subroutine
        
        
        
                # terminate your program
                li $v0, 10      # v0 contains the number for exit, 10
                syscall         # trap: exit

