# COMP122 Lecture Notes: April 12, 2023

## Announcements:
   - In-class Exam: April 19th
     * Coverage:
       - Formats and Encodings
       - MIPS programming

## Today's Agenda:

   1. Java's Integer Represenations
   1. Converting Base n --> Base 10 (Recall)
   1. Converting Base 10 --> Base 2 (Recall)
   1. Floating Point Representation (Recall)
   1. Java's ~ and - operators:
   1. Complements of numbers: Review
   1. Encodings (8 bit): Review
   1. Binary Addition: Review
  


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am: 
   * T/R @ 2:00 pm: 

## Review from Last-time:

 
---
# Today's Material

   1. Java's Integer Represenations:
      * `unsigned int X;` -- Nope does not have it
      * `signed int X`
         - byte  | 1 byte  | -  2^7 ..  2^7 -1 | -128 to 127
         - short | 2 bytes | - 2^15 .. 2^15 -1 | -32,768 to 32,767
         - int   | 4 bytes | - 2^23 .. 2^23 -1 | -2,147,483,648 to 2,147,483,647
         - long  | 8 bytes | - 2^32 .. 2^31 -1 | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

   1. Converting Base n --> Base 10 (Recall)

      - 16#     ==> 10#
        | v  |  =  |  v  | * | base | + | digit | glyph |
        |----|-----|-----|---|------|---|-------|-------|
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |  

      - 16#      ==>  10# 
        | v  |  =  |  v  | * | base | + | digit | glyph |
        |----|-----|-----|---|------|---|-------|-------|
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |   
        |    |  =  |     | * | base | + |       |       |          


   1. Converting Base 10 --> Base 2 (Recall)
       - 10#      ==>  2# 

       ```
       number = 162                       
         1234 / 2 -> 617, 0
          617 / 2 -> 308, 1
          308 / 2 -> 154, 0
          154 / 2 ->  77, 0
           77 / 2 ->  38, 1
           38 / 2 ->  19, 0
           19 / 2 ->   9, 1
            9 / 2 ->   4, 1
            4 / 2 ->   2, 0
            2 / 2 ->   1, 0
            1 / 2 ->   0, 1
            0 / 2 ->   0, 0
                                  
       answer: (from bottom to top)      
       ```

   1. Floating Point Representation
      - Example - 123.1234  --> 2# - 1111011.00011111100101110010010

        1. Obtain the binary string
           ```
           $ mips_subroutine dec2bin 123 . 1234 4
           1111011.00011111100101110010010
           ```
         1. Put into Scientific Notation
            - 2# - 1 . 111011 00011111100101110010010 x 2^ + 0110 (6)

         1. Encode the value
            - Encode the sign
            - Drop the whole
            - Add the bias to the exponent (6 + 15)
            - Truncate / Pad the mantissa
            - Shift the values into place

         1. For Binary16
            - x | x xxxx |  xxxx xxxx xxx
            - 1 | 1 0110 |  1110 1100 011
   

   1. Java's ~ and - operators:
      1.  short int x = ~ y;   
          - x and y are 1 complements
          - x + y =  2^16 - 1;  // 0 : 1111 1111 1111 1111

      1.  short int a = - b;   
          - a and b are 2 complements
          - a + b =  0 == 2^16  // 1 : 0000 0000 0000 0000

      1.  ( ~ X + 1 )  = - X


   1. Complements of numbers
      * What is ... 
        - the 1's complement of 5 ?   ~5
        - the 2's complement of 5 ?   -5
      * What is
        - the binary string for 5?
        - the binary string for -5?

      * What is the binary encoding of:
        -  5:
        - ~5:
        - -5:



   1. Encodings (8 bit)
      -  5 = 2# + 0000 0101
      - -5 = 2# - 0000 0101

     | number | unsigned  | 1's comp  | 2's comp  |
     |--------|-----------|-----------|-----------|
     |   5    | 0000 0101 | 0000 0101 | 0000 0101 |
     |  -5    | -- NA --  | 1111 1010 | 1111 1011 |


   1. Binary Addition
      ```
      x xxxx xxxx               <!-- response: carries -->
        xxxx xxxx               <!-- response: op1 encoding -->
      + xxxx xxxx               <!-- response: op2 encoding -->
      ------ ----           
      y yyyy yyyy               <!-- response: sum encoding -->
      ```

---
## Resources



---
## Notes
<!-- This section is for students to place their notes -->


