# This example MIPS program reads an integer from standard input, and 
# then echos the value onto standard output .
# 
# 
#   1. the variable num is allocated 4 bytes within the .data segment
#   1. the subroutine "main" is placed into the .text segment
#   1. the subroutine "main" performs the following major steps
#      - Trap to the kernel to read an integer
#        - the "read integer" routine has been assigned the number 5
#      - Store the value to memory at location "num"
#      - Load the value from memory location "num"
#      - Trap to the kernel to write an integer
#      - Trap to the system to exit the program


                .data
num:            .space 4        # space for a integer number
        
                .text
                .globl main
        
main:           nop             
                li $v0, 5       # Service #5: read decimal
                syscall         
                nop             # The register v0 holds the value just read
        
                sw $v0, num     # Store the value in v0 registers to main memory

                lw $t0, num     # Load the value in main memory into a0
        
                move $a0, $t0   # 
                li $v0, 1       # Service #1:  print decimal integer
                syscall         # 
        
                li $v0, 10      # Service #10: terminate the program
                syscall      

