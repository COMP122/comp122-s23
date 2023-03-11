# COMP122 Lecture Notes: March 8, 2023

## Announcements:
   1. Assignments: 
      - 23-floating-point: March 12 23:59
      - 42-expressions: March 9 23:59
      - 43-binary32: March 12 23:59


## Today's Agenda:

   1. Macros and Printf

   1. Testing Harness for MIPS subroutines

   1. binary32 Errata / Clarification 
 
   1. Lab Time..

   1. For-loop and while-loop statements


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: none
   * M/W @ 2:00 pm: 
     - what is the data type for a 1 byte of storage?
   * T/R @ 9:00 am: none
   * T/R @ 2:00 pm:


## Review from Last-time:


---
# Today's Material

  1. Macros:  (Provided Macros: mips/macros/)
     - Uses:
       * to improve readability of your program
       * to eliminate repetitive code construction
       * to reduce overhead associated with subroutines

     - Syntax:

       ```
       .macro {name}( %arg_1 .. %arg_n)
            # list of MIPS Native Instructions
       .end_macro
       ```

     - Example Definition

       ```
       .macro print_t(%reg)
         move $a0, %reg
         li $v0, 35
         syscall
       .end_macro

       .macro print_ti(%imm)
         li $a0, %imm
         li $v0, 35
         syscall
       .end_macro

       ```

     - Example Usage

       ```
       print_t $t1
       print_ti 0x34AF34
       ```

  1. printf:  formats and prints
      - man printf
      - syntax:  printf("string", arg_1 .. arg_n)
      - example:  

        ```
        int A = 42;
        System.out.printf("The value of A: %x\n", A)   //  "The value of A: 2A"
        ```
      - Description: Decodes the variable into a human readable format

        | Format           | Code |  Java Example     | MIPS Macro     |
        |------------------|:----:|-------------------|----------------|
        | A string         |  %s  | printf("%s", A);  | print_s(A)     |
        | A character      |  %c  | printf("%c", a);  | print_c(a)     |
        | A decimal #      |  %d  | printf("%d", a);  | print_d(a)     |
        | A unsigned #     |  %u  | printf("%u", a);  | print_u(a)     |
        | An octal #       |  %o  | printf("%o", a);  | print_o(a)     |
        | A hexadecimal #  |  %x  | printf("%x", a);  | print_x(a)     |
        | A binary #       |  %t  |                   | print_t(a)     |
        | A percent        |  %%  | printf("%%");     | print_ci('%')  |
        | A new-line       |  \n  | printf("\n");     | print_ci('\n') |
        | A return         |  \r  | printf("\r");     | print_ci('\r') |
        | A tab            |  \t  | printf("\t");     | print_ci('\t') |
        | A single quote   |  \'  | printf("\'");     | print_ci('\'') |
        | A double quote   |  \"  | printf("\"");     | print_ci('"')  |
        | A backslash      |  \\  | printf("\\");     | print_ci('\\') |


  1. Testing Harness for MIPS subroutines
     > Picking good test cases is important to facilitate the debugging of your code

     1. Examples for the encode_binary32 (all are equivalent)

        ```bash
        $ mips_subroutine encode_binary32 '+' 0x34E1 '-' 41
        00101011010100111000010000000000

        $ mips_subroutine encode_binary32 '+' 2#0011010011100001 '-' 2#0101001
        00101011010100111000010000000000
     
        $ mips_subroutine encode_binary32 '+' '2#1 1010011100001' '-' '2#010 1001'
        00101011010100111000010000000000
     
        $ mips_subroutine encode_binary32 0x2b 0x34E1 0x2d 0x29 
        00101011010100111000010000000000
        ```

     1. Additional Test Cases
        1. Inputs:  '-' 0x110 '+' 3 
           - binary output: 1 1000 0010 0001 0000 0000000 0000 0000
           - hexadecimal output:  0xce7be000
           - decimal output: -1056440320
        
        1. Inputs: '-' 0xFFFFFFFFFFFF '+' 128 
           - binary output: 1111111111111111 1111111111111111
           - decimal output: -1
        
        1. Inputs: '+' 0xAAAA '-' -125 
           - binary output: 01111110001010101010101000000000
           - integer output: 2116725248

        ```bash
        $ mips_subroutine encode_binary32 '-' 0x110 '+' 3 
        11000001000010000000000000000000
        $ mips_subroutine encode_binary32 '-' 0xFFFFFFFFFFFF '+' 128 
        11111111111111111111111111111111
        $ mips_subroutine encode_binary32 '+' 0xAAAA '-' -125  
        01111110001010101010101000000000
        ```


  1. 42-binary32 Errata / Clarification 
      - if (sign == '-') 
        * both the left and the right expressions must be variables
        ```
        $r = '-';           
        if (sign == $r) {
        ```
      - pos_msb = position_most_significant_bit(coefficient);
        * Error in naming in the Prof's code
          - position_of_msb() versus position_most_significant_bit()
        * Missing transliteration for TAC for Macro Call
          - Java
            ```java
            pos_msb = position_most_significant_bit(coefficient);
            ```
          - MIPS
            ```mips
            position_of_msb($reg)
            move pos_msb, $v0
            ```

  1. Lab Time..

  1. For-loop and while-loop statements:  (Same thing in Java)
     - Simple Example

     ```java
     for( i=0; i < top ; i++) {
      
      
     }
     ```

     ```java TAC
     init:    ;
              i=0;
     loop:    for(; i<top; ) {
     body:       ;          
                 body;
     
     next:       ;
                 i++;
                 
                 continue;
              }
     done:    ; 
     ```

     - On the fly examples:
       1. ASCII Encode Table
       1. print CLI arguments
       1. count down
       1. summation


---
## Resources

  * TAC Instructions and Corresponding MIPS Instructions

      | TAC Equations                 | MIPS Instructions         |
      |-------------------------------|---------------------------|
      | `x = imm;`                    | `li x, imm`               |
      | `x = a;`                      | `move x, a`               |
      | `x = a + imm; `               | `addi x, a, imm`          |
      | `x = a - imm; `               | `subi x, a, imm`          |
      | `x = a + b;`                  | `add x, a, b`             |
      | `x = a - b;`                  | `sub x, a, b`             |
      | `x = a * b;`                  | `mul x, a, b`             |
      | `x = a >>> imm;`              | `srl x, a, imm`           |
      | `x = a >> imm;`               | `sra x, a, imm`           |
      | `x = a << imm;`               | `sll x, a, imm`           |
      | `x = a >>> b;`                | `srlv x, a, b`            |
      | `x = a >> b;`                 | `srav x, a, b`            |
      | `x = a << b;`                 | `sllv x, a, b`            |


      | TAC Instruction               | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `if (a <cond> b) {`           | `b<! cond> a, b, alt`     |
      | `else {`                      | `# end of block`          |
      | `for(; a <cond> b ;) {`       | `b<! cond> a, b, done`    |
      | `while(a <cond> b) {`         | `b<! cond> a, b, done`    |
      | `continue;`                   | `b loop`                  |
      | `// break;`                   | `b done`                  |
      | `break;`                      | `b done`                  |
      | `}`                           | `# end of block`          |


      | `TAC <cond>` | `MIPS <cond>` | `MIPS <! cond>` |`TAC <! cond>` |
      |:------------:|:-------------:|:---------------:|:-------------:|
      | `<`          | `lt`          | `ge`            |  `>=`         |
      | `<=`         | `le`          | `gt`            |  `>`          |
      | `!=`         | `ne`          | `eq`            |  `==`         |
      | `==`         | `eq`          | `ne`            |  `!=`         |
      | `>=`         | `ge`          | `lt`            |  `<`          |
      | `>`          | `gt`          | `le`            |  `>=`         |
   
      | JAVA: MIPS OS Interface       | MIPS Macro                |
      |-------------------------------|---------------------------|
      | `mips.print_t(a);`            | `print_t(a)`              |
      | `mips.print_ti(imm);`         | `print_ti(imm)`           |
      | `mips.print_c(a);`            | `print_c(a)`              |
      | `mips.print_ci(imm);`         | `print_ci(imm)`           |

  
---
## Notes
<!-- This section is for students to place their notes -->


