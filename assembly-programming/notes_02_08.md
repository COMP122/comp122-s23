# COMP122 Lecture Notes: February 8, 2023

## Announcements:
   1. Lab Day

## Today's Agenda:
   1. Tidbit on Git Merge
   1. Review of M/T
   1. Mathematical Expressions and Syntax
      - prefix, infix, and postfix notation
      - PEMDAS: Parentheses, Exponents, Multiplication/Division, Addition/Subtraction

   1. TAC Expression (Three Address Code for Expressions)
      - each expression can reference at most three addresses

      | TAC Expression                | MIPS Expression           |
      |-------------------------------|---------------------------|
      | `x = imm`                     | `li x, imm`               |
      | `x = a`                       | `move x, a`               |
      | `x = a + imm `                | `addi x, a, imm`          |
      | `x = a - imm `                | `subi x, a, imm`          |
      | `x = a + b`                   | `add x, a, b`             |
      | `x = a - b`                   | `sub x, a, b`             |
      | `x = a * b`                   | `mul x, a, b`             |
      | `x = a >>> imm`               | `srl a, imm`              |
      | `x = a >> imm`                | `sra a, imm`              |
      | `x = a << imm`                | `sll a, imm`              |

   1. System Calls:
      - Java API
        * System.out.printf()
        * System.exit()

      - MIPS ISA
        * Analogy: Use of a Dead-Drop
        * $v0 holds the Service Routine #
          * print integer:   Service Routine #1
          * print character: Service Routine #11
          * exit with value: Service Routine #17
        * $a0, $a1, $a2, $a3 holds the required transferred information
        * `syscall` to trigger the transition form your program to the kernel


   1. Practicum: `surface-array-box`

 

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am
   * M/W @ 2:00 pm
   * T/R @ 9:00 am
   * T/R @ 2:00 pm


## Review from Last-time:
   1. 
   1.
   1. 
      

---
## Practicum
  1. Install MIPS syntax package into sublime
     - Install Package Control
       * cmd+shift+p 
       * Package Control: Install Package 
       * mips-syntax

  1. Accept the Laboratory Assignment: 
     ```
     open https://classroom.github.com/a/HguPKR5J
     ```

  1. Clone the assignment
     ```
     cd classes/comp122/deliverables
     git clone git@github.com:comp122/41-expressions-\<username\>.git
     cd 41-expressions
     ```

  1. Print_42 Discussion
     - print_42.java
       ```
       javac surface_area_box
       java surface_area_box
       ```
     - print_42.s
       - MIPS Overview Slides
       - Walk through the MARS interface


  1. Surface Area of a Box: `surface_area_box.java`
     1. Discuss and Write the Java Code
     1. Tag and Commit the Java code
        ```
        git add surface_area_box.java
        git commit -m 'version 1 of java code'
        git tag java_v1
        ```

  1. Rewrite the code in TAC form
     1. TAC for the surface area of a box
     1. Rewrite the Java Code
     1. Submit the Java Code
        ```
        git add surface_area_box.java
        git commit -m 'version 2 of java code'
        git tag java_v2
        git push --tags
        ```

  1. MIPS: Surface Area of a Box: `surface_area_box.s`
     1. Insert the TAC as a comment block
     1. Translate the TAC into MIPS code

  1. MIPS Assembly and Testing
     1. Use MARS to run `surface_area_box.s`
     1. Submit the MIPS Code
        ```
        git add surface_area_box.s
        git commit -m 'my mips program done'
        git push --tags
        ```

---
## Resources
   - tidbit-git-merge.md
   - https://classroom.github.com/a/HguPKR5J
   - documents/mips-overview.txt

   - Definition:  Dead Drop
     * prearranged place for the deposit and pickup of information 

---
## Notes
<!-- This section is for students to place their notes -->


