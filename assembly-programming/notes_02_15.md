# COMP122 Lecture Notes: February 15, 2023

## Announcements:
   1. Quiz this weekend
   1. Finish Lab II


## Today's Agenda:
   1. Review from last lecture (material is on the quiz)
   1. Tid bit on the shell
   1. Practicum II: `surface-array-box`

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am: 
   * T/R @ 2:00 pm: 

 
## Review from Last     

---

## Shell Tid bit:

   1. Process:
      - Anatomy:

   1. Creating a process
      1. Command line options: modifies the action of the process
         * shorthand form: -l -i -R or -liR
         * verbose form:  --graph --oneline

      1. Command line arguments:  what the process acts upon
         * Pattern Matching
           - `*` : Matches any string, including the null string.
           - `?` : Matches any single character.
           - `[]` : Matches any single character with the braces
         * Example
           ```
           cd comp122
           subl models*/notes*       # I.e., the notes for the test
           open models*/documents/*  # I.e., the slices for the test
           ```

   1. Standard Files:
      1. Initially mapped by the parent process, typically the shell
         - stdin (0): is mapped to the keyboard by default
         - stdout (1): is mapped to the terminal by default
         - stdout (2): is mapped to the terminal by default
      1. Remapping of files:
         - stout:
           * redirect to new file: `cmd > file`
           * redirect to end of existing file: `cmd >> file`
         - stderr:
           * redirect to new file: `cmd 2> file`
           * redirect to end of existing file: `cmd 2>> file`
         - stdin:
           * redirect to from a file:  "<"

    1. Combining Processes 
       1. Pipe-lining:
          -  cat file | sort | head
       1. Lists:
          - Unconditional:  `;`,  `&`
            * Example: 
              - `cd class ; cd comp122 ; git pull ;`
              - `git pull & mars & subl program.s`
          - Conditional  `&&`, `||`
            - `ls program.s && subl program.s`
            - `ls program.s || echo "file not found"`

    1. Some command commands:
       - ls
       - sort
       - cat
       - head
       - tail
       - diff
       - wc
       - grep


## Practicum II:

  1. Print_42 Discussion
     - print_42.java
       ```
       javac print_42
       java print_42
       ```
     - print_42.s
       - MIPS Overview Slides
       - Walk through the MARS interface
       - CLI use of MARS


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

   1. TAC Equation (Three Address Code for Equation)
      - each expression can reference at most three addresses/variable

      | TAC Equations                 | MIPS Instructions         |
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


---
## Notes
<!-- This section is for students to place their notes -->


