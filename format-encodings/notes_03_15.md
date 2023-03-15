# COMP122 Lecture Notes: March 15, 2023

## Announcements:
   1. Assignments: 
      - Spring break next week
      - 43-binary32: 
        * late submissions until Thursday Mar 23:59:59


## Today's Agenda:

   1. Strings and For-loops

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
   * T/R @ 2:00 pm:


## Review from Last-time:

  1. For-loop Transformation --> Java TAC (Recall)
     1. Explicity identify with labels the section of the loop
        - init, loop(test), body, next, done
     1. Move the init arm to the init block
     1. Move the next arm to the next block
     1. Simplify the boolean expression into three parts
        - evaluate the left-hand side into $l
        - evaluate the righ-hand side into $r
        - the test:    `loop: for(;  $l <cond> $r ;)`
     1. Place a copy of the lhs and rhs equations
        - at the end of the init block
        - at the end of the next block
     1. Add the explicit `continue;` to the bottom of the next block 


  1. Java TAC transliteration into MIPS
     - Copy your Java TAC into your MIPS file
     - Comment out your JAVA TAC code
     - Use the TAC tables to write the MIPS code line-by-line
     - Consider tranliterating, e.g., 
        * `} else {`   -->  # end of block


---
# Today's Material

  1. String Processing

  1. Java Strings: three independent types
     1. A string is an object that contains an array of characters
     1. A string is an constant array of characters 
     1. A char[] is a fixed sized array of characters

     ```java
      String O = new String( "A string!"); // An object
      String S = "A string!";              // A constant array (+ stuff?)
      char[] A = S.toCharArray();          // An array 
      
      int l    = A.length;                 // A property: Computed or Stored?
      ```

   1. Generalized Structure of a String:
      - See the Drawing on the Board!


   1. MIPS Declaration of a String
      ```mips
             .data
      A:     .ascii "A "
             .word 0
      B:     .asciiz "string!"

             .text
      ```

   1. Java: A.length  versus  C: strlen()
      - man strlen
      - man -k string | grep ^str

      ```java

      for(i=0; A[i]!='\0'; i++);
      return i;

      ```

      ```java TAC
      init:    ;
               i=0;
               $l = A[i];
               $r = '\0';
      loop:    for(; $l != $r ;) {
      body:      ;
      next:      i++;
                 $l = A[i];
                 $r = '\0';

                 continue;
               }
      done:    ;          
                  
               return i;     // defer till later
      ```

   1. Array Indexing
      - x = A[imm]
        - load the address of A into a register
          - `la $t0, A`
        - "load" "byte" into the register
           - lbu x, imm($t0)
      - x = A[i]
        - load the address of A into a register
          - `la $t0, A`
        - modify the address to be A[i]'s address
          - add $t0, $t0, i
        - "load" "byte" into the register
           - lbu x, imm($t0)


   
   | TAC String Equations          | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `x = A[imm];`                 | `la p, A`                 |
   |                               | `lbu x, imm(p)`           |
   |                               |                           |
   | `x = A[v];`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `lbu x, 0(p)`             |
   |                               |                           |
   | `A[imm] = x;`                 | `la p, A`                 |
   |                               | `sb x, imm(p)`            |
   |                               |                           |
   | `A[v] = x;`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `sb x, 0(p)`              |
   |                               |                           |
   | `x = & A;`                    | `la p, A`                 |
   | `x = (* p);`                  | `lbu x, 0(p)`             |
   | `(* p) = x;`                  | `sb x, 0(p)`              |

  
   1. Java: A.length, C: strlen(), MIPS: strlen()

      ```mips
                # t0  : i
                # t1  : $l
                # t2  : $r 
                # t3  : p, 
                # t4  : &A

      init:     nop                       # ;
                li $t0, 0                 # i=0;
                la $t3, A                 # $l = A[i];
                add $t3, $t3, $t0
                lbu $t1, 0($t3)


                li $t2, '\0'              # $r = '\0';
      loop:     beq $t1, $t2, done        # for(; $l != $r ;) {
      body:       nop                     #   ;
      next:       addi $t0, $t0, 1        #   i++;
                                    
                  la $t3, A               # $l = A[i];
                  add $t3, $t3, $t0
                  lbu $t1, 0($t3)

                  li $t2, '\0'            #   $r = '\0';

                b loop                    #   continue;
                                          # }
      done:     no                        # ;          
                                          #    
                move $v0, $t0             # return i;     // defer till later
                jr $ra
      ```



  1. Practicum:  strchr()
     - Prototype: `char[] strchr(char[] A, int c);`
     - Description: locate a char in a string

  ```java
     for(i=0; A[i]!=\0; i++){
          if (A[i] == c) {
            break;
        }
     }
     return i;

  ```

  ```java TAC
        init:    ;
               i=0;
               $l = A[i];
               $r = '\0';
      loop:    for(; $l != $r ;) {
      body:      ;

                 $l = A[i];
                 $r = c;
                 if (A[i] == c) {
      cons:        ;
                   break loop;
                   // break
                 } else {
      alt:         ;
                   //break;
                 }

      next:      i++;
                 $l = A[i];
                 $r = '\0';

                 continue loop;
               }
      done:    ;          
                  
               return i;     // defer till later
      ```

  ```mips

                # t0  : i
                # t1  : $l
                # t2  : $r 
                # t3  : p, 
                # t4  : &A
                # t5  : $ll
                # t6  : $rr

      init:     nop                       # ;
                li $t0, 0                 # i=0;
                la $t3, A                 # $l = A[i];
                add $t3, $t3, $t0
                lbu $t1, 0($t3)


                li $t2, '\0'              # $r = '\0';
      loop:     beq $t1, $t2, done        # for(; $l != $r ;) {
      body:       nop                     #   ;

      init_if:                            # $ll = A[i];
                                          # $rr = c;

      test:                               # if (A[i] == c) {
      cons:                               #    ;
                                          #    break loop;
                                          #    // break
                                          #  } else {
      alt:                                #    ;
                                          #    //break;
                                          #  }
      done_if:                            #  ;


      next:       addi $t0, $t0, 1        #   i++;
                                    
                  la $t3, A               # $l = A[i];
                  add $t3, $t3, $t0
                  lbu $t1, 0($t3)

                  li $t2, '\0'            #   $r = '\0';

                b loop                    #   continue;
                                          # }
      done:     no                        # ;          
                                          #    
                move $v0, $t0             # return i;     // defer till later
                jr $ra
 

  ```




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
      | `;`                           | `nop`                     |
      | `x = imm;`                    | `li x, imm`               |
      | `x = - imm`                   | `subi x, $zero, imm`      |
      | `x = - a`                     | `sub  x, $zero, a`        |
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


      | TAC String Equations          | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = A[imm];`                 | `la p, A`                 |
      |                               | `lb x, imm(p)`            |
      |                               |                           |
      | `x = A[v];`                   | `la p, A`                 |
      |                               | `add p, p, v`             |
      |                               | `lb x, 0(p)`              |
      |                               |                           |
      | `A[imm] = x;`                 | `la p, A`                 |
      |                               | `sb x, imm(p)`            |
      |                               |                           |
      | `A[v] = x;`                   | `la p, A`                 |
      |                               |                           |
      |                               | `add p, p, v`             |
      |                               | `sb x, 0(a)`              |
      |                               |                           |
      | `x = & A;`                    | `la x, A`                 |
      | `x = (* p);`                  | `lb x, 0(p)`              |
      | `(* p) = x;`                  | `sb x, 0(p)`              |


      | TAC Instruction               | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `label: ;`                    | `label: nop`              |
      | `if (a <cond> b) {`           | `b<! cond> a, b, alt`     |
      | `} else {`                    | `# end of block`          |
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
      |  See printf:                  | etc., etc., etc.,         |

  1. ![String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)
  
---
## Notes
<!-- This section is for students to place their notes -->


