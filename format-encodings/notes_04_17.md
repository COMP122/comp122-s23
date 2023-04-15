# COMP122 Lecture Notes: April 17, 2023

## Announcements:
   - In-class Exam: April 19/20
     * Coverage:
       - Formats and Encodings
       - MIPS programming

## Today's Agenda:

   1. Multiplication
   1. Participation: 07-mutlitiplication  

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am: 
   * T/R @ 2:00 pm: 

## Review from Last-time:

 
---
# Today's Material

  1. Multiplication
     - Issues:
       1. Overflow: 
          - Consider: 127 * 127 = 16,129 
            ```java mult_size.j
            public static int mult_size() {
               byte a = 127;
               byte b = 127;
               
               byte c = a * b;
               return c;
            }   
            ``` 
          - java_subroutine mult_size
            ```
            mult_size.j:5: error: incompatible types: possible lossy conversion from int to byte
            ```
      
          - Recall: 
            - `byte`  valid range:    -128 to    127  | max 2^7-1
            - `short` valid range: -32,768 to 32,767  | max 2^15 -1

       1. Execution Time:
          - Successive Additions
            ```java mult_loop.j
            public static int mult_loop(int a, int b) {
            
                 int $v0 = 0;
                 for(int i = 1 ; i <= b; i++){
            add:       $v0 = $v0 + a;
                 }
                 return $v0;
            }
            ```
          - Notice line: `add` above
            - It is executed `b` times.

     - Alternative Approach:
       1. Specialized Hardware: (Mult/Add unit)
       1. Long Multiplication:  (Software)
          
       1. Long Multiplication

---
## Resources



---
## Notes
<!-- This section is for students to place their notes -->


