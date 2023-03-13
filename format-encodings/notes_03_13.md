# COMP122 Lecture Notes: March 13, 2023

## Announcements:
   1. Assignments: 
      - 21-table-encodings: graded
      - 42-expressions: graded
      - Spring break next week

   1. Issues:
      1. Just-in-time learning (an example)
          > 43-binary32: 
          > accepted at Mar 12 22:16 
          > due at Mar 12 23:59

      1. tl;dr 
         > The more words I put into README.md, ...
         > The greater the probability you will read it

      1. java encode_binary32.java 
         > Project containts two class files,
         > Per the directions:  
           1. `javac encode_binary32.java`
           1. `java encode_binary32`

      1. java encode_binary32
         ```bash
         "Exception in thread "main" java.lang.UnsupportedClassVersionError: MIPS_OS_Interface has been compiled by a more recent version of the Java Runtime (class file version 63.0), this version of the Java Runtime only recognizes class file versions up to 62.0"
         ```
         * upgrade your Java JDK version
         * recompile "MIPS_OS_Interface.java"
           - java MIPS_OS_Interface.java

      1. No Main subroutine in encode_binary32.s. 
         > I.e., no place for the subroutine to return to..
         ```
         $ mars encode_binary32.s
         MARS 4.5  Copyright 2003-2014 Pete Sanderson and Kenneth Vollmar
         00101011010100111000010000000000
         Error in : invalid program counter value: 0x00000000
         Processing terminated due to errors.
         ```
         > One of the main reasons why `mips_subroutine` was provided to you

      1. Calling mips_subroutine with the no arguements:
         ```
         Error in .boot.s line 12 column 23: Symbol "arg_0" not found in symbol table.
         ```
         - technically a bug in my program  `mips_subroutine`
         - update to fix the problem is forth-coming
           * you will need to do a `git pull` to get the update

      1. Updated information in the spec (i.e. README.md)
         ```$ git push
          To github.com:COMP122/43-binary32-smf-steve.git
           ! [rejected]        main -> main (non-fast-forward)
          error: failed to push some refs to 'github.com:COMP122/43-binary32-smf-steve.git'
          hint: Updates were rejected because the tip of your current branch is behind
          hint: its remote counterpart. Integrate the remote changes (e.g.
          hint: 'git pull ...') before pushing again.
          hint: See the 'Note about fast-forwards' in 'git push --help' for details.
          ```
         - Read the output from the command
   ---

   1. ChatGPT
      - Pondents say.. is posed to be a game changer in Academia, etc.
      - It can provide ~answers~ solutions to many problems
        - Provide me with a Java program that ....
      - data -> information -> knowledge -> wisdom
      - In the world to come..as it always has been
        - It is all about asking a well-thought questions!

   ---

   1. Slack Search
      - Want an answer to a problem?
      - Chances are another student has already asked!
      - Search slack to see if there is already a solution provided.
      - If not, provide a well-though out question!

   1. Grading
      - Will grade 43-binary32 on Friday
        - you may continue to work on it unitl Thursday Mar 23:59:59
        - a late penalty will be applied (how much?, it depends!)
      

## Today's Agenda:

   1. For-loop and while-loop statements


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
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
     $ mips_subroutine -a encode_binary32 -t '+' '2#1 1010011100001' '-' '2#010 1001'
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
              i=0;        // init
              $l = i;     // left-right eval
              $r = limit;
     loop:    for(; $l < $r ; ) {
     body:       ;          
                 // body;
     
     next:       ;
                 i++;        // next
                 $l = i;     // left-right eval
                 $r = limit;

                 continue;
              }
     done:    ; 
     ```

     - On the fly examples:
       1. ASCII Encode Table
       1. Count down
       1. Summation
       1. Reduction


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


