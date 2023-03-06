# COMP122 Lecture Notes: March 1, 2023

## Announcements:
   1. Assignment: 23-floating-point to be assigned 
      - Due: March 12 23:59:59

   1. Assignment: 42-expressions has been assigned
      - 41-expressions: 47% earned 100 points
        - goals:
          - refresh your Java skills from 110
          - use of tags for different versions of code
          - ensure you tested your submissions
          - ease you in to TAC and MIPS
          - use of MARS
      - 42-expressions:
        - for the 47% of you who earned 100 points on 41-expressions 
          - Accept the assignment by: March 7 23:59
          - Otherwise you are done, and have earned 100 points
        - 53% who did not -- redo the assignment!
          - Accept the assignment by: March 7 23:59
          - Redo the assignment
          - Due: March 9 23:59
   1. Assignment: 43-binary32 has been or will be assigned.
      - Due: March 12 23:59


## Today's Agenda:
   1. 24-floating-point
      - Real number conversion: Hex, Oct --> Binary
      - Scientific Notation with other bases

   1. Conversions Tool:
      - Decimal <--> Hex, Oct, Binary
      - https://www.csun.edu/~steve/classes/integers-conversion-encoding/index.html#integer

   1. Coding Practicum: IF-THEN-ELSE
      - Bubble Sort with Min-switch

   1. 43-binary32 walk through 


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
   * T/R @ 2:00 pm: 

## Review from Last-time:


---
# Today's Material
   1. 24-floating-point
      - Real number conversion: Hex, Oct --> Binary
      - Scientific Notation with other bases

   1. Conversions Tool:
      - Decimal <--> Hex, Oct, Binary
      - https://www.csun.edu/~steve/classes/integers-conversion-encoding/index.html#integer

   1. Coding Practicum:  IF-THEN-ELSE
      - Bubble Sort with Min-switch

      ```java
      //  Bubble Sort:
      for (i=0; i<9; i++) {
        for (j=i; j<10; i++) {

          ///////////////////////////////
          // Min Switch
          if ( A[i] < A[j] ) { 
            t1 = A[i];
            t2 = A[j];
            A[i] = t2;
            A[j] = t1;
          }
          //////////////////////////////
        }
      }
      ```
   1. Min-switch programming in MIPS

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
    
   1. 43-binary32 walk through 

---
## Resources

  * Integer Conversion and Encoding:
    - https://www.csun.edu/~steve/classes/integers-conversion-encoding/index.html#integer

---
## Notes
<!-- This section is for students to place their notes -->


