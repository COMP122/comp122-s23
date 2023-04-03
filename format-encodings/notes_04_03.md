# COMP122 Lecture Notes: April 3, 2023

## Announcements:
   1. Grading
      - 44-strlen:
          - graded (contents of repo as of Tuesday Midnight)
          - code was provided in previous class notes
          - more weight provided to Java, then to Java TAC, and then MIPS

      - 44-dec2bin:
          - graded (contents of repo as of Thursday Midnight): grade.report.05
          - transformed into 05-dec2bin.java
          - i.e., transferred to Particiation credit

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
      - 06-fractional2bin:

   1. Base10: Mathematical Review
   1. (Foreshadow) Base2: Encodings and Mathematical Review


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am: 
   * T/R @ 2:00 pm: 


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
         - See above
      1. Fractional part: .23 --> . 0011101011100001010001111010111
         - Previously:
           ```java
           max = 100;            // The desired precision
           n = 23;               // the fractional value
           while (n != 0 ) {
              n = n * 2
              if ( n >= max ) {
                  mips.print_di(1);
                  n = n - max; 
              } else {
                  mips.print_di(0);
              }
           }
           ```

        - Revised:
          ```java
          static void frac2bin(integer fractional_value, integer num_digits, int max_size) {
  
              max = 100;            // max = Math.pow(10, num_digits);
              n = 23;               // the fractional value
              for(count=0; count < max_size; count++ ) {
                 n = n * 2
                 if (n == 0) 
                   break;
                 if ( n >= max ) {
                     mips.print_di(1);
                     n = n - max; 
                 } else {
                     mips.print_di(0);
                 }
              }
          }
          ```
       - Foreshadow:  


      1. Put the pieces together:
         - "100111010" + '.' + "0011101011100001010001111010111"

   1. Base10: Mathematical-review
      - See Slides: comp122/format-encodings/documents/base10-mathematical-review.pdf
 

---
## Resources

  1. Mathematical Review: 
     - comp122/format-encodings/documents/base10-mathematical-review.pdf

  1. Base2: Encodings and Mathematical Operations: 
     - comp122/format-encodings/documents/base2-encoding-and-mathematical-operations.pdf


  1. Scaffolding for fractional2bin

     ```java

     class fractional2bin {
       static MIPS_OS_Interface mips = new MIPS_OS_Interface();
     
       static void fractional2bin(integer fractional_value, integer num_digits, int max_size) {
     
       
       }
     
       public static void main(String[] args){
         final int mantissa_size = 23;  // This is the number of bits a binary32 mantissa
      
         arg_0 = Integer.parseInt(arg[0]);
         arg_1 = (args[1])[0];
         arg_2 = Integer.parseInt(args[2];
         precision = args[2].length;
      
         dec2bin(arg_0);
         mips.printc(arg_1);
         fractional2bin(arg2, precision, mantissa_size);
     
         return;
       } 
     }
     ```  


---
## Notes
<!-- This section is for students to place their notes -->


