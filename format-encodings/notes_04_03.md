# COMP122 Lecture Notes: April 3, 2023

## Announcements:
   1. Grading
      - 44-strlen:
          - graded (contents of repo as of Tuesday Midnight)
          - code was provided in previous class notes
          - more weight provided to Java, then to Java TAC, and then MIPS

      - 45-dec2bin:
          - graded (contents of repo as of Thursday Midnight): grade.report.05
          - transformed into 05-dec2bin.java
          - i.e., transferred to Participation credit

   1. Tasks:
      - Accept the following assignments:
        1. 05-whole2bin: https://classroom.github.com/a/UxIBrZbU
           - copy over your java code from 45-dec2bin
           - your current grade is in 45-dec2bin-{account}/grade.report.05

        1. 06-fractional2bin: https://classroom.github.com/a/_XTqm8hx
           - copy over all your code from 45-dec2bin

        1. 45-dec2bin:
           - Reframed into a true programming assignment
           - Due Date: April 13 23:59:59
           - Specification to be provided

## Today's Agenda:
   1. Pick up where we left off:  Decimal Real to Binary Real
      - 05-whole2bin:  Java-TAC --> MIPS.
   
   1. Foreshadow: 06-fractional2bin:


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
      - translation from TAC -> MIPS, how to do %
      - some reports of 44-strlen not having grade.report
   * M/W @ 2:00 pm: 
     - none
   * T/R @ 9:00 am: 
     - none
   * T/R @ 2:00 pm: 
     - none

## Review from Last-time:

   1. Algorithm: Base 10 to Base 2
      ```java
      n = number;
      for (count = 0; n != 0 ; count++ ){
        n = n / 2;
        r = n % 2;
        mips.push(r);
      }
      for ( ; count > 0; count-- ) {
        d = mips.pop();
        mips.print_d(d);
      }
      ```

---
# Today's Material

  1. Decimal Real to Binary Real 
      1. Example:   314.23 -->  2# 100111010 . 0011101011100001010001111010111
         - https://docs.google.com/spreadsheets/d/1aMvlfw_rzvYBObT94dX8v_O0EgELHgWrmZgWKmoLY7s/edit#gid=1434558784
      1. Whole part:  
         - 314 --> 2# 100111010

  1. Review the code we wrote the other day
  1. Walk through the Java -> MIPS transliteration

  1. Integer Division Operation at the hardware level
     - (r, w)  =  n / d;
     - two values are returned
       - the "r"emander goes into "hi"
       - the "w"hole part goes into "lo"
     - hi and lo are special purpose registers
       - associated instructions:

     | Pseudo Instruction    | MIPS Instruction       |
     |-----------------------|------------------------|
     | `x = $hi;`            | `mfhi x`               |
     | `x = $lo;`            | `mflo x`               |
     | `$hi = x;`            | `mthi x`               |
     | `$lo = x;`            | `mtlo x`               |


    ```mips
     .macro mod(%dst, %src1, %src2)
         div %src1, $src2
         mfhi %dst
     .end_macro
     ```

---
## Resources

  1. Mathematical Review: 
     - comp122/format-encodings/documents/base10-mathematical-review.pdf

  1. Base2: Encodings and Mathematical Operations: 
     - comp122/format-encodings/documents/base2-encoding-and-mathematical-operations.pdf

  1. Additional TAC to MIPS mappings

     | TAC Mult / Div Equations      | MIPS Instruction          |
     |-------------------------------|---------------------------|
     | `x = a * b;`                  | `mult a, b`               |
     |                               | `mflo x`                  |
     |                               |                           |
     | `x = a / b;`                  | `div a, b`                |
     |                               | `mflo x`                  |
     |                               |                           |
     | `x = a % b;`                  | `div a, b`                |
     |                               | `mfhi x`                  |
     |                               |                           |

     | TAC Mult/Div Psuedo Equations | MIPS Instruction          |
     |-------------------------------|---------------------------|
     | `x = a * b;`                  | `mul x, a, b`             |
     | `x = a / b;`                  | `div x, a, b`             |
     | `x = a % b;`                  | `rem x, a, b`             |

 

---
## Notes
<!-- This section is for students to place their notes -->


