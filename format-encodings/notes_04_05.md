# COMP122 Lecture Notes: April 5, 2023

## Announcements:

## Today's Agenda:

   1. 06-fractional2bin: https://classroom.github.com/a/_XTqm8hx
      - copy over all your code from 45-dec2bin

   ~1. Base10: Mathematical Review~
   ~1. (Foreshadow) Base2: Encodings and Mathematical Review~


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: none
   * M/W @ 2:00 pm: none
   * T/R @ 9:00 am: none
   * T/R @ 2:00 pm: none

## Review from Last-time:

 1. Decimal Real to Binary Real 
      1. Example:   314.23 -->  2# 100111010 . 0011101011100001010001111010111
         - https://docs.google.com/spreadsheets/d/1aMvlfw_rzvYBObT94dX8v_O0EgELHgWrmZgWKmoLY7s/edit#gid=1434558784
      1. Whole part:  
         - 314 --> 2# 100111010

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


    - mod r, n, d  : rem r, n, d
    ```mips
     .macro mod(%dst, %src1, %src2)
         div %src1, $src2
         mfhi %dst
     .end_macro
     ```
     - div_mod r, q, n, d
     - div_mod(r, q, n, d)
     ```mips
     .macro div_mod(%dst1, %dst2, %src1, %src2)
         div %src1, $src2
         mfhi %dst1
         mflo %dst2
     .end_macro
     ```

 
---
# Today's Material

  1. Fractional Part: .23 --> . 0011101011100001010001111010111
     - Previously:
       ```java
       max = 100;            // The desired precision
       n = 23;               // the fractional value
       while (n != 0 ) {
          n = n * 2
          if ( n >= max ) {
              mips.print_d(1);
              n = n - max; 
          } else {
              mips.print_d(0);
          }
       }
       ```

    - Revised:
      * frac2bin(fractional_value, num_digits, max_size)
      ```java

          max = 100;            // max = Math.pow(10, num_digits);
          n = 23;               // the fractional_value
          for(count=0; count < max_size; count++ ) {
             n = n * 2
             if (n == 0) break;
             if ( n >= max ) {
                 mips.print_ci('1');
                 n = n - max; 
             } else {
                 mips.print_ci('0');
             }
          }
      ```
    - Foreshadow your new 45-dec2bin assignment

      1. Put the pieces together:
         - "100111010" + '.' + "0011101011100001010001111010111"
         ```java
         void dec2bin(whole, fractional, precision, max_size) {
         
            whole2bin(n);
            mips.print_ci('.');
            fractional2bin(fractional, digits, max);
            mips.print_ci('\n');
            return;
         }
         ```


   1. Base10: Mathematical-review
      - See Slides: comp122/format-encodings/documents/base10-mathematical-review.pdf
 

---
## Resources

1. Scaffolding for fractional2bin

     ```java

     class fractional2bin {
       static MIPS_OS_Interface mips = new MIPS_OS_Interface();
     
       static void fractional2bin(int fractional, 
                                  int precision, 
                                  int max_size) {
     
       
       }
     
       public static void main(String[] args){
         final int mantissa_size = 23;  
         // This is the number of bits in a binary32 mantissa
      
         arg_0 = Integer.parseInt(arg[0]);
         arg_1 = (args[1])[0];
         arg_2 = Integer.parseInt(args[2];
         precision = args[2].length;
      
         dec2bin(arg_0);
         mips.printc(arg_1);
         fractional2bin(arg_2, precision, mantissa_size);
         mips.printc('\n');
         return;
       } 
     }
     ```  

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

     ```mips
     .macro mod(%dst, %src1, %src2)
         div %src1, $src2
         mfhi %dst
     .end_macro
     ```

     | TAC Mult/Div Psuedo Equations | MIPS Instruction          |
     |-------------------------------|---------------------------|
     | `if (a <cond> b) break;`      | `b<cond> a, b, $done`     |
     | `if (a <cond> b) continue;`   | `b<cond> a, b, $loop`     | 
     * note caveats on continue


  

---
## Notes
<!-- This section is for students to place their notes -->


