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
     - 21-expression:  use \n or nl to represent 0x0a, don't go to the next line
   * M/W @ 2:00 pm: 
     - $13
     - 0x versus binary string
     - number of bits in the encoding of "blah"  where 2^n = blah
   * T/R @ 9:00 am:
     - 
   * T/R @ 2:00 pm: 
     - 

## Review from Last-time:
   - Unpacking the payload


---
# Today's Material
   1. Floating Point: See Slides
      - encode_float.md
   1. Bitwise Operations: See Slides

   1. JAVA TAC: 
      - Just a style of program to facility transliteration to Assembly
      - An exercise in Operational Semantics

      1. Equations: PEMDAS  (done)
      1. Basic Blocks
         - labels:
         - statements: goto, break, continue
      1. Control-flow Constructs
         - if-then-else
         - for loops
         - while loops
      1. Methods (defer till later)

   1. If-then-else statement:
      ```java
      if ( bool_express ) {
      
        consequence;
      
      } else {
      
        alternative;
      
      }
      ```

   1. If-then-else TAC Transformation
      1. Identify the parts of the if-then-else
      1. Add labels to the top of each of these parts
      1. Insert control-flow commands as comments at the end of these parts
      1. Decompose and Reposition the boolean expression into three parts
         - evaluate the left-hand side into $l
         - evaluate the righ-hand side into $r
         - perform a simple test:  $l <cond> $r
      
      ```java tac
      top:    ;
              // $l = ...
              // $r = ...
              if( test ) {       // test: $l <cond> $r
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
              b<! cond> $l, $r, alt        # if( $l <cond> $r ) {
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


