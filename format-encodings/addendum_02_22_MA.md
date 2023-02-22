# COMP122 Addendum File: February 22, 2023 Monday Afternoon

## Resources:
   1. Fix Length Encodings: https://docs.google.com/spreadsheets/d/1eUNgDk746G9y_BstasdvrxU6iA7T5FdsiBWwvo0TH7M/edit#gid=0
   1. MIPS Encodings: https://docs.google.com/spreadsheets/d/1r9cj9x71JBVv3En-cOYanqRW4zSz53oSXLlScOparqY/edit#gid=0
   1. Keyboard Encodings: https://docs.google.com/spreadsheets/d/1eJCdUuydOccLiJcQDYv-PRZVd6jbiM67V7GPXYJYqAs/edit#gid=0


### Binary to Octal
  1. 2# 11010111000110101010110010101100
     - 2# 011 010 111 000 110 101 010 110 010 101 100
     - 8#   3   2   7   0   6   5  2    6   2   5   4
     - 8# 32 706 526 254
     - 032706526254  (in Java, C, C++, Ada, pascal, ....)

  1. 2# 10110101111111100101000001011
     - 2# 010 110 101 111 111 100 101 000 001 011
     - 8# 2 6 5 7 7 4 5 0 1 3


### Binary to HEX
  1. 2# 11010111000110101010110010101100
     - 2#   1101 0111 0001 1010 1010 1100 1010 1100
     - 16#  D    7    1    A    A    C    A    C

### Binary to BCD

  1. 2# 11010111000110101010110010101100
     - 2#   1101    0111 0001 1010 1010 1100 1010 1100
     - 10#  invalid   7    1  invalid invalid ....

### Octal to Binary
  1. 01343453
     - 8#   0     1  3   4  3    4   5   3
     - 2#   000 001 011 100 011 100 101 011
     - 2#   0000 0101 1100 0111 0010 1011
     - 16#     0    5    C   7   2  B

### Hex to Binary

### BCD to Binary

   1. 23487592
      -     2    3    4    8    7    5    9    2
      - 2#  0010 0011 0100 1000 0111 0101 1001 0010


### ASCII to HEX

   1. printf("this is simple!")
      - ASCII: this is simple!
      - 16# 7468 6973 2069 7320 7369 6D70 6521 0000

   1. ASCII: HELLO World!!!
      - 16# 4845 4C4C 4F20 576F 726C 6421 2121 0000


### MIPS Registers

  1. $v0: 0 0010
  1. add: 10 0000
  1. j:   00 0010




### UTF-8 chunking

  1. 2#  110110111011110001100100
    - 2#  11011011 10111100  |  01100100  |
    - 2#    011011   111100  |   1100100  |


---
## Notes
<!-- This section is for students to place their notes -->
