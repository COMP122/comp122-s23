# COMP122 Lecture Notes: April 12, 2023

## Announcements:
   - In-class Exam: April 19/20
     * Coverage:
       - Formats and Encodings
       - MIPS programming

## Today's Agenda:

   1. Java's Integer Represenations
   1. Converting Base n --> Base 10 (Recall)
   1. Converting Base 10 --> Base 2 (Recall)
   1. Floating Point Representation (Recall)
   1. Java's unary operators: ~ and - 
   1. Complements of numbers: Review
   1. Encodings (8 bit): Continuation from M/T
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
        - unsigned char  | 1 byte  | 0 .. 2^8-1   | 0 to 255
        - unsigned short | 2 bytes | 0 .. 2^16 -1 | 0 .. 64K
        - unsigned int   | 4 bytes | 0 .. 2^32 -1 | 0 .. 4GB 


      * `signed int X`  .byte, .half, .word, .dword
        - byte  | 1 byte  | -  2^7 ..  2^7 -1 | -128 to 127
        - short | 2 bytes | - 2^15 .. 2^15 -1 | -32,768 to 32,767
        - int   | 4 bytes | - 2^31 .. 2^31 -1 | -2,147,483,648 to 2,147,483,647
        - long  | 8 bytes | - 2^63 .. 2^63 -1 | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

   1. Converting Base n --> Base 10 (Recall)

      - 16#     ==> 10#
        |   v  |  =  |   v  | * | base | + | digit | glyph |
        |------|-----|------|---|------|---|-------|-------|
        |      |  =  |      | * | base | + |       |       |   
        |      |  =  |      | * | base | + |       |       |   
        |      |  =  |      | * | base | + |       |       |   
        |      |  =  |      | * | base | + |       |       |   
        |      |  =  |      | * | base | + |       |       |   
        |      |  =  |      | * | base | + |       |       |  
   
    

   1. Converting Base 10 --> Base 2 (Recall)
       - 10# 1234  ==>  2# 0100 1101 0010

       ```
       number = 1234                       
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
                                  
       answer: 0100 1101 0010 (from bottom to top)      
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

         1. Encode the value in, say, Binary16
            - Encode the sign
            - Drop the whole
            - Add the bias to the exponent (6 + 15)
            - Truncate / Pad the mantissa
            - Shift the values into place

         1. For Binary16
            - s | e eeee |  mmmm mmmm mmm
            - x | x xxxx |  xxxx xxxx xxx
            - 1 | 1 0101 |  1110 1100 011
   

   1. Java's ~ and - operators:
      1.  (unsigned) short int x = ~ y;   
          - x and y are 1 complements
          - x + y =  2^16 - 1;  // 0 : 1111 1111 1111 1111

      1.  (unsigned) short int a = - b;   
          - a and b are 2 complements
          - a + b =  0 == 2^16  // 1 : 0000 0000 0000 0000

      1.  ( ~ X + 1 )  = - X


   1. Complements of numbers
      * What is ... 
        - the 1's complement of X?  ~X
        - the 2's complement of 5 ?  -5 

      * What is
        - the binary string for 5?   2# + 0000 0101 . 0000
        - the binary string for -5?  2# - 0000 0101 . 0000

      * What is the binary encoding of:  (say 16 bits)
        -  5: 0000 0000 0000 0101
        - ~5: 1111 1111 1111 1010
        - -5: 1111 1111 1111 1011



   1. Encodings (8 bit)
      -  5 = 2# + 000 0101
      - -5 = 2# - 000 0101

      -  133 = 2# + 1000 0101
      - -133 = 2# - 1000 0101

      - 25  = 2# +  0001 1001
      - -25 = 2# -  0001 1001 

                  binary
     | number | unsigned  | 1's comp   | 2's comp   |
     |--------|-----------|------------|------------|
     |   5    | 0000 0101 | 0 000 0101 | 0 000 0101 |
     |  -5    |    NA     | 1 111 1010 | 1 111 1011 |
     |  133   | 1000 0101 | --- NA --  | -- NA --   |
     | -133   |    NA     |            |            |

     |  25    | 0001 1001 | 0001 1001  | 0001 1001  |
     | -25    | -- NA --  | 1110 0110  | 1110 0111  |



   1. Binary Addition (2's complement encoding)
      - 5 - 25
      - 5 + -25

      ```
      0 0000 1110               <!-- response: carries -->
        0000 0101               <!-- response: op1 encoding -->
      + 1110 0111               <!-- response: op2 encoding -->
      ------ ----           
      0 1110 1100               <!-- response: sum encoding -->
      ```
      * decode: 1110 1100 
        - ~ 1110 1100 = 0001 0011
        - +1 0001 0011 = 001 0100 
        - 001 0100 = 10# 20

   1. Binary Addition (1's complement encoding)
      -  5 - 25 --> 5 + -25

      ```
      0 0000 1111               <!-- response: carries -->
        0000 0101               <!-- response: op1 encoding -->
      + 1110 0110               <!-- response: op2 encoding -->
      ------ ----           
      0 1110 1100               <!-- response: sum encoding -->
      ```

---
## Resources

   1. 4-bit Encodings with the associated binary string:
      - binary: (unsigned values)
      - 1's complement
      - 2's complement

      | #  | binary |   1's  |   2's  |  binary string |
      |---:|--------|--------|--------|----------------|
      | -8 |   --   |   --   |  1000  |   2# - 1000    |
      | -7 |   --   |  1000  |  1001  |   2# - 0111    |
      | -6 |   --   |  1001  |  1010  |   2# - 0110    |
      | -5 |   --   |  1010  |  1011  |   2# - 0101    |
      | -4 |   --   |  1011  |  1100  |   2# - 0100    |
      | -3 |   --   |  1100  |  1101  |   2# - 0011    |
      | -2 |   --   |  1101  |  1110  |   2# - 0010    |
      | -1 |   --   |  1110  |  1111  |   2# - 0001    |
      | -0 |   --   |  1111  |   --   |      --        |
      |  0 |  0000  |  0000  |  0000  |   2#   0000    |
      |  1 |  0001  |  0001  |  0001  |   2# + 0001    |
      |  2 |  0010  |  0010  |  0010  |   2# + 0010    |
      |  3 |  0011  |  0011  |  0011  |   2# + 0011    |
      |  4 |  0100  |  0100  |  0100  |   2# + 0000    |
      |  5 |  0101  |  0101  |  0101  |   2# + 0001    |
      |  6 |  0110  |  0110  |  0110  |   2# + 0010    |
      |  7 |  0111  |  0111  |  0111  |   2# + 0011    |
      |  8 |  1000  |   --   |   --   |   2# + 1000    |
      |  9 |  1001  |   --   |   --   |   2# + 1001    |
      | 10 |  1010  |   --   |   --   |   2# + 1010    |
      | 11 |  1011  |   --   |   --   |   2# + 1111    |
      | 12 |  1100  |   --   |   --   |   2# + 1100    |
      | 13 |  1101  |   --   |   --   |   2# + 1101    |
      | 14 |  1110  |   --   |   --   |   2# + 1100    |
      | 15 |  1111  |   --   |   --   |   2# + 1101    |




---
## Notes
<!-- This section is for students to place their notes -->


