# COMP122 Addendum File: February 23, 2023 Tuesday Afternoon

## Resources:
   1. Fix Length Encodings: https://docs.google.com/spreadsheets/d/1eUNgDk746G9y_BstasdvrxU6iA7T5FdsiBWwvo0TH7M/edit#gid=0
   1. MIPS Encodings: https://docs.google.com/spreadsheets/d/1r9cj9x71JBVv3En-cOYanqRW4zSz53oSXLlScOparqY/edit#gid=0
   1. Keyboard Encodings: https://docs.google.com/spreadsheets/d/1eJCdUuydOccLiJcQDYv-PRZVd6jbiM67V7GPXYJYqAs/edit#gid=0


### Binary to Octal
   1. 2# 10101010111110000110101011010101
      - 2# 010 101 010 111 110 000 110 101 011 010 101
      - 8# 2    5   2   7  6   0    6   5  3    2   5


### Binary to HEX
   1. 2# 10101010111110000110101011010101
      - 2#   1010 1010 1111 1000 0110 1010 1101 0101
      - 16#  A    A    F    8    6    A    D    5



### Binary to BCD
   1. 2# 10101010111110000110101011010101
      - 2#   1010 1010 1111 1000 0110 1010 1101 0101
      - 10#  inv  inv  inv  8    6    inv  inv  5

### Octal to Binary
  1. 8# 23764
     - 2# 010 011 111 110 100


### Hex to Binary
### BCD to Binary
### ASCII to HEX

   1. "Bye!\n"
      - 4279 6521 0A00
   1. "Next W"
      - 4E65 7874 2057 0000
  
### HEX to ASCII
   1. 7820 0A65 4E00
      - "x \neN"

### MIPS

   1. (register)  $a0: 0 0100
   1. (func)      sub: 100 010
   1. (op)          j: 000 010  


## UTF-8
   - 2# 1110011010011111101011010100111
   - 2# 11100110  10011111  10101101 0100111
   - 2# |  11100110  10011111  10101101  |  0100111
   - pat   1110xxxx  10xxxxxx  10xxxxxx  (good)
   - 2#       0110    011111    101101

   - 2#       0110    011111    101101
   - 2#   0110011111101101
   - 2#   0110 0111 1110 1101
   - 16#  6 7 E D



















---
## Notes
<!-- This section is for students to place their notes -->
