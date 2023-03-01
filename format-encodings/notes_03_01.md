# COMP122 Lecture Notes: March 1, 2023

## Announcements:
   1. Assignment: 23-floating-point to be assigned 
   1. Assignment: 42-floating-point to be assigned

## Today's Agenda:
   1. Floating Point
      - encode_float.md
   1. Bitwise Operations
   1. Java Practicum  (Simplifying things)

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
   * T/R @ 2:00 pm: 

## Review from Last-time:
   - ???

---
# Today's Material
   1. Floating Point: See Slides
      - encode_float.md
   1. Bitwise Operations: See Slides

   1. JAVA TAC: 
      - Just a style of program to facility transliteration to Assembly

      1. Equations: PEMDAS
      1. Commands/Methods:  Traps to the OS
      1. Basic Blocks
         - introduction of label
         - goto, break, continue
      1. Control-flow
         - if-then-else
         - for loops
         - while loops
      1. Methods  ()

   1. If-then-else
      ```java
      if ( bool_express ) {
      
        consequence;
      
      } else {
      
        alternative;
      
      }
      ```
   1. If-then-else TAC Transformation
      1. identify the part of the if-then-else
      1. add labels to the top of these parts
      1. insert comments at the end of these parts
      1. simplify the boolean expression into three parts
         - evaluate the left-hand side into $l
         - evaluate the righ-hand side into $r
         - test:  $l <cond> $r
      
      ```java tac
      top:    ;
              // $l = ...
              // $r = ...
              if ( test ) {       // test: $l <cond> $r
      cons:     ;
                consequence;
                // break;
              } else {
      alt:      ;
                alternative;
                // break;
              }
      done:   ;
      ```
      
      ```mips
      top:  nop                            # ;
              # left-eval                  # $l = ...;
              # right-eval                 # $r = ...;
              b<! cond> $l, $r, alt        # if ( $l <cond> $r ) {
      cons:   nop                          #   ;
              # consequence                #   consequence;
              b done                       #   // break;
                                           # } else {
      alt:    nop                          #   ;
              # alternative                #   alternative;
              b done                       #   // break;
                                           # }
      done:   nop                          # ;
      
      ```

---
## Resources
   - documents/floating-point-encoding.pdf
   - documents/bitwise-operations.pdf
   - encode_float.md
   
---
## Notes
<!-- This section is for students to place their notes -->


