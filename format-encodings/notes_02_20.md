# COMP122 Lecture Notes: February 20, 2023

## Announcements:
   1. 41- Part 1 was due on last Thursday night
   1. 41- Part 2 is due on Tuesday night @23:59

   1. Microsoft OS, Powerpoint, git-bash, and ???
      - Powerpoint slides are now provided in PDF format
      - 

## Today's Agenda:
   1. Tagging related commands
      ```
      $ git tag                      # lists your tags
      $ git tag {name}               # create a tag at the current commit
      $ git tag {name} {commit}      # create a tag at the named commit
      $ git tag -d {name}            # delete a tag
      $ git push --tags --force      # force the update of tag changes
      $ git pull --tags --force      # force the update of tag changes

      ```
      Note using new syntax for variable replacement: {name} 

   1. Finish 41- discussion
   1. Walk through of MIPS examples
   1. Start of "Introduction to Encodings"
     

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am:
   * M/W @ 2:00 pm:
   * T/R @ 9:00 am: 
   * T/R @ 2:00 pm: 

## Review from Last-time:
   - ???

---
# Today's Material
  1. Finish 41- discussion
     ```java
     // $a0 : height of the box
     // $a1 : length of the box
     // $a2 : width of the box
     // $v0 : surface area

     //  2 * height * length + 2 * height * width + 2 * length * width;
     
     // Version 1: Single Equation    
     $v0 = (2 * a0 * a1) + (2 * a0 * a2) + (2 * a1 * a2); 
     
     // Version 2: In the style of "Three Address Code"
     $t0 = 2;
     $t0 = $t0 * $a0;
     $t0 = $t0 * $a1;
     
     $t1 = 2;
     $t1 = $t1 * $a0;
     $t1 = $t1 * $a2;
     
     $t2 = 2;
     $t2 = $t2 * $a1;
     $t2 = $t2 * $a2;
     
     $v0 = $t0 + $t1;
     $v0 = $v0 + $t2;
     ```
     
     - Note there are many solution!!
     - Note the difference in the following instructions:
       ```java
       $v0 = 2 + $t0;     // This instruction is invalid!
       $v0 = $t0 + 2;     // This instruction is valid!
       $v0 = 2 * $t0;     // This instruction is invalid!
       $v0 = $t0 * 2;     // This instruction is invalid!
       ```

  1. Walk through of MIPS examples

  1. Introduction to Encodings
     - See slides

---
## Resources
  1. tidbits/MARS.md
  1. mips/\*.s

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


