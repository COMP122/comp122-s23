# COMP122 Addendum File: February 27, 2023 Tuesday Afternoon

### Resources:
   1. Encode: encode_utf8.md
   1. Decode: decode_utf8.md

### Review from last time if any


### UTF-8 Encoding

#### Example

* Prerequisite: Convert the Unicode character into a binary string.
  - U+008C
  - 16# 008C
  - 2#  0000 0000 1000 1100

1. Determine the position of the most significant bit; let `p` be that value.
   - p: 8

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 11
   - b: 2

3. Pad/Truncate the binary string to be of length `l`
   - 2# 000 1000 1100

4. Chunk the binary string into the following sizes:
   - b : 5, 6
   - 2# 000 10
   - 2# 00 1100


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

   - 110x xxxx   | 10 xxxxxx
   - 1100 0010   | 10 001100


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 1100 0010   | 10 001100
  - 2# 1100 0010   | 1000 1100
  - 16# C2 8C
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`


#### Example


* Prerequisite: Convert the Unicode character into a binary string.
  - U+20054
  - 16# 20054
  - 2#  0010 0000 0000 0101 0100

1. Determine the position of the most significant bit; let `p` be that value.
   - p=18

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 21
   - b: 4

3. Pad/Truncate the binary string to be of length `l`
   - 2# 0 0010 0000 0000 0101 0100

4. Chunk the binary string into the following sizes:
   - b=4 :  3, 6, 6, 6
   - 2#  0 0010 0000 0000 0101 0100
   - 2#  000  |  10 0000  |  0000 01  | 01 0100


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

  - 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
  - 1111 0000   | 10 100000 | 10 000001 | 10 010100 |



* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 1111 0000  10 100000  10 000001  10 010100 
  - 2# 1111 0000  1010 0000  1000 0001  1001 0100 
  - 16# F0A0 8194
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`




### UTF-8 Decoding

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# f3b2bca3 346EFa43   
  - 2#  1111 0011 1011 0010 1011 1100 1010 0011 0011 0100 0110 ...

1. Chunk the string into bytes
   - 2# 1111 0011  |  1011 0010 |   1011 1100  |  1010 0011 | ->   | 0011 0100 | 0110 ...

2. Determine the total number of bytes ('b') used to encode

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - b bytes: 4

3. Gather the number of bytes, 'b'.
   - 2# 1111 0-011
   - 2# 10-11 0010
   - 2# 10-11 1100
   - 2# 10-10 0011


4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 10-11 0010  check
   - 2# 10-11 1100  check
   - 2# 10-10 0011  check


5. Unpack the payload by removing the framing bits
   - 2# 011 11 0010 11 1100 10 0011
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2#  0000 1111 0010 1111 0010 0011
  - 16# F2F23


















---
## Notes
<!-- This section is for students to place their notes -->
