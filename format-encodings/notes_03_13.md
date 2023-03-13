# COMP122 Lecture Notes: March 13, 2023

## Announcements:
   1. Assignments: 
      - 21-table-encodings: graded
      - 42-expressions: graded
      - Spring break next week


## Today's Agenda:

   1. For-loop and while-loop statements


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am:
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am: none
   * T/R @ 2:00 pm:


## Review from Last-time:

  1. Macros:  (Provided Macros: mips/macros/)
       - Java TAC --> MIPS
       ```java
       pos_msb = position_most_significant_bit(coefficient);
       ```
       ```mips
       position_of_msb($reg)
       move pos_msb, $v0
       ```

  1. printf:  formats and prints
  1. Testing Harness for MIPS subroutines
     ```bash
     $ mips_subroutine encode_binary32 '+' '2#1 1010011100001' '-' '2#010 1001'
     00101011010100111000010000000000
     ```

---
# Today's Material


  1. For-loop and while-loop statements:  (Same thing in Java)
     - Simple Example

     ```java
     for( i=0; i < limit ; i++) {
       
       // body
      
     }
     ```

     ```java TAC
     init:    ;
              i=0;  // init
              ;     // left-right eval
     loop:    for(; i<limit; ) {
     body:       ;          
                 // body;
     
     next:       ;
                 i++;  // next
                 // left-right eval
                 
                 continue;
              }
     done:    ; 
     ```

     - On the fly examples:
       1. ASCII Encode Table
       1. Print CLI arguments
       1. Count down
       1. Summation


---
## Resources

  * TAC Instructions and Corresponding MIPS Instructions
    - see also: ~/classes/comp122/reference/MIPS-cheatsheet.pdf
    - `MIPS <op_i>  <- Java operator`
      * addi: +, subi: -, ori: |, andi: &, xori: ^
    - `MIPS <op>  <- Java operator`
      * add: +, sub: -, or: |, and: &, xor: ^,


      | TAC Equations                 | MIPS Instructions         |
      |-------------------------------|---------------------------|
      | `x = imm;`                    | `li x, imm`               |
      | `x = a;`                      | `move x, a`               |
      | `x = a <op_i> imm; `          | `<op_i> x, a, imm`        |
      | `x = a <op> b;`               | `<op> x, a, b`            |
      | `x = ~ a`                     | `nor x, a, $zero`         |
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
      | `continue;`                   | `b top`                   |
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


