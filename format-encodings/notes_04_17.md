# COMP122 Lecture Notes: April 17, 2023

## Announcements:
   - In-class Exam: April 19/20
     * Coverage:
       - Formats and Encodings
       - MIPS programming
   - Assignment 24-binary-addition released
   - Participation 07-multiplication available
     - https://classroom.github.com/a/MEy_MAfw

## Today's Agenda:

   1. Multiplication
   1. Long Multiplication: Base 10
   1. Long Multiplication: Base 2
      - with an array of digits
      - with a register stack of digits
   1. Specialized Hardware
   1. Participation: 07-multiplication  

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
            ```java java/mult_size.j
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
            - java_subroutine mult_loop a b

            ```java java/mult_loop.j
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

  1. Long Multiplication: Base 10
     - View the number as an array of digits;
     
     ```java java/long_mult.j
     public static int long_mult(int a, int b){
       int[] B = digits(b);

       int sum = 0;
       for (int d = 0 ; d < B.length ; d ++ ) {
         sum += a * B[d];
         a = a * 10 ;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine long_mult 23 10
     ```

  1. Long Multiplication: Base 2
     - Leverage:
       - x * 0 == 0
       - x << 1 ==  x * 2
       - x >>> 1 == x / 2

     ```java java/long_mult_bin
     public static int long_mult_bin(int a, int b){
       int[] B = binary_digits(b);
     
       int sum = 0;
       for (int d = 0 ; d < 32 ; d ++ ) {
         if (B[d] == 1) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```
     ```bash
     cd java
     java_subroutine long_mult_bin 23 10
     ```

  1. Long Multiplication: Base 2
     - View the register as a stack

     ```java java/multiplication.j
     public static int multiplication(int a, int b){
       // Algorithmic Complexity: O(word_size)

       int sum = 0;
       int bit = 0;

       for (; b != 0 ; ) {
         // pop off a bit from b
         bit = b & 0x01;  
         b = b >>> 1;

         if ( bit == 1 ) {
           sum += a;
         }
         a = a << 1;
       }
       return sum;
     }
     ```

     ```bash
     cd java
     java_subroutine multiplication 23 10
     ```


  1. Specialized Hardware (Mult/Add unit)
     - native instructions 
       - mul $t0, $t1
       - div $t0, $t1
       - madd $t0, $t1
         *  `a*x + b*x + c*x` 
     - pseudo instructions
       - mult, div, rem, etc.

  1. Practicum: 
     - multiplication.s
     - https://classroom.github.com/a/AUw69HyY


---
## Resources

  1. documents/multiplication.pdf

---
## Notes
<!-- This section is for students to place their notes -->


