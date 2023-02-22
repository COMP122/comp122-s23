# COMP122 Addendum File: February 22, 2023 Monday Morning

## Resources:
   1. Fix Length Encodings: https://docs.google.com/spreadsheets/d/1eUNgDk746G9y_BstasdvrxU6iA7T5FdsiBWwvo0TH7M/edit#gid=0
   1. MIPS Encodings: https://docs.google.com/spreadsheets/d/1r9cj9x71JBVv3En-cOYanqRW4zSz53oSXLlScOparqY/edit#gid=0
   1. Keyboard Encodings: https://docs.google.com/spreadsheets/d/1eJCdUuydOccLiJcQDYv-PRZVd6jbiM67V7GPXYJYqAs/edit#gid=0


### Binary to Octal
  1. 2# 100101100110101010100110100101010010101010101010001111100101010
     - 2# 100 101 100 110 101 010 100 110 100 101 010 010 101 010 101 010 001 111 100 101 010
     - 8# 4     5  4   6   5   2   4   6  4   5   2   2   5   2   5  2   1   7    4  5 2
     - 8# 454652464522525217452
     - 0454652464522525217452  (in java)


### Binary to HEX
  1. 2# 100101100110101010100110100101010010101010101010001111100101010
     - 2# 0100 1011 0011 0101 0101 0011 0100 1010 1001 0101 0101 0101 0001 1111 0010 1010
     - 16# 4     B   3    5    5   3   4   a   9  5  5  5  1  f 2  a
     - 16# 4B35534A95551F2A
     - 0x4B35534A95551F2A

### Binary to BCD
  1. 2# 100101100110101010100110100101010010101010101010001111100101010
     - 2# 0100 1011    0011 0101 0101 0011 0100 1010   1001 0101 0101 0101 0001 1111 0010 1010
     - 10# 4   invalid   3    5    5   3   4   invalid   9   5    5     5   1  invalid 2  invalid
     - This is not a valid BCD string



### Octal to Binary


### Hex to Binary

   1. 16#  3FAB2 
      - 2#  0011 1111  1010  1011  0010

   1. 16#  23A6723 
      - 2#  xxxx xxxx xxxx xxxx xxxx xxxx xxxx
      - 2#  0010 0011 1010 0110 0111 0010 0011

### BCD to Binary
   1. 3457d34   --- example of a invalid BCD input

### ASCII to HEX
  1. Hello There
     - 0x 4865 6C6C 6F20 54


---
## Notes
<!-- This section is for students to place their notes -->
