# COMP122 Lecture Notes: February 13, 2023

## Announcements:
   1. 02- and 03- have been graded
      ```
      cd deliverables
      cd 02-*
      git pull
      subl grade.report
      ```
   1. The grade.report and grade_guesstimator
      - adminatrative/grade.report.example
      - bin/grade_guesstimator

   1. Quiz: This weekend.
      - Released at: 15:00 on Friday via slack
      - Due at 23:59 on Sunday
      - Two hour time limit

   1. Example Quiz
      - https://github.com/COMP122/quiz-models
      - NOT a study guide
      - Questions WILL BE different



## Today's Agenda:
   1. Review of ISA
   1. Processes
     

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: -- just questions about the test, not the material
   * M/W @ 2:00 pm: -- just questions about the test and grading
   * T/R @ 9:00 am: 
     - how do you move one file to another directory
       - mv src dst
       - git mv src dst
   * T/R @ 2:00 pm


## Review from Last-time:
   1. Instruction Set Architecture
      - on level above the physical arch
      - has 5 main characteristic
        1. supported data type: integer (signed/unsigned), float, double,
        1. register: size, number, purpose
        1. semantics and instructions
        1. memory: endianess, alignment, layout , addressing,
        1. OS interface

      - general steps
        1. fetch
        1. decode
        1. execute
        1. write-back
   1. Difference between API and a ISA
   1. RISC / CISC
      - CISC: example X86, has lots of complex instructions, few registers
      - RISC, has a few simple instructions,lots of registers


   1. Universal Computer
      - large tape -- large memory
      - control unit -- firmware
      - OS -- on tape, and this make a universal computer
      - generic program -- on tape, and is your program
      - i/o from outside


   1. MIPS
      - has 5 sub-steps :
        - fetch 
        - decode / operated fetch 
        - execute -- the ALU computes the mathematical function
        - memory access (read or write)
        - write back (to a register)

   1. memory organization
      - split between code and data
      - split between kernel and user
      - kernel: code (ktext) and data (kdata)
      - user: code (text), data (data), heap, stack  (segments)


      - three basic types of instructions:
        - arithmetic 
        - data movement
        - control flow



      

---
# Today's Material
  1. Processes
     - See slides
  1. Potentially: Pickup where we left off on the lab -- nope, not happening!

---
## Resources

---
## Notes
<!-- This section is for students to place their notes -->


