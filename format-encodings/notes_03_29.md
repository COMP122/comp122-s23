# COMP122 Lecture Notes: March 29, 2023

## Announcements:
   1. None:

## Today's Agenda:

   * Consider: 314.23  == 2# 100111010 . 0011101011100001010001111010111

   5. Conversion Decimal Real to Binary Real 

   4. Algorithm: Base 10 to Base b

   3. Conversion between Base 10 & Base b
    
   2. Conversion between Powers of 2

   1. Conversion Practicum: 


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
   * T/R @ 2:00 pm:


## Review from Last-time:

---
# Today's Material

  1. Convergence: Practicum
     - Successively evaluate a mathematical equation until the value converges
       *  n = n / d;     # Integer Division

        ```java
        body:  ;
               n = n / d;     # Integer Division
               mips.print_d(n);
               count ++;
        ```
     - Example:
       *  n = 100,  d = 5;
       *  n ->  100, 20, 4, 0


  1. Conversion between Powers of 2:
     - BTDT: Been There, Done That


  1. Conversion between Base 10 & Base b
     1. Base b to Base 10
        - Use Expanded Notation to determine its value (v), or
        - For each digit d in the number, evaluate the equation
          *  v = v * b + base10(d);     

        - Example: Base 2 to Base 10
          * number:  2# 1
            - v = 0 * b + base10(1)

          * number:  2# 101
            - 1 = 0 * b + base10(1)
            - 2 = 1 * b + base10(0)
            - 5 = 2 * b + base10(1)

     1. Base 10 to Base b
        - Evaluate the following equation till it converges to zero
          *  n = n / b

        - In conjunction, determine there remainder of the integer division
          *  r = n % b

        - The concatenation of the remainders--in reverse--is the Base b number.

   1. Algorithm: Base 10 to Base b

      ```java
      n = number;
      for (count = 0; n != 0 ; count++ ){
        n = n / 2;
        r = n % 2;
        push(r);
      }
      for ( ; count > 0; count-- ) {
        d = pop();
        mips.print_d(d);
      }
      ```

   1. Decimal Real to Binary Real 
      1. Example:   314.23 -->  2# 100111010 . 0011101011100001010001111010111
         - https://docs.google.com/spreadsheets/d/1aMvlfw_rzvYBObT94dX8v_O0EgELHgWrmZgWKmoLY7s/edit#gid=1434558784
      1. Whole part:  
         - 314 --> 2# 100111010
         - See above
      1. Fractional part: .23  --> . 0011101011100001010001111010111

         ```java
         max = 100;            // The desired precision
         n = 23;               // the fractional value
         while (n != 0 ) {
            n = n * 2
            if ( n > max ) {
                mips.print_di(1);
                n = n - max; 
            } else {
                mips.print_di(0);
            }
         }
         ```

      1. Put the pieces together:
         "100111010" '.' "0011101011100001010001111010111"


---
## Resources

  1. [Fixed Length Encodings](https://docs.google.com/spreadsheets/d/1eUNgDk746G9y_BstasdvrxU6iA7T5FdsiBWwvo0TH7M/edit#gid=0)

  1. [Real to Binary Conversion](https://docs.google.com/spreadsheets/d/1aMvlfw_rzvYBObT94dX8v_O0EgELHgWrmZgWKmoLY7s/edit#gid=1434558784)




---
## Notes
<!-- This section is for students to place their notes -->


