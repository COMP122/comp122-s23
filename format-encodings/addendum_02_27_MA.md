# COMP122 Addendum File: February 27, 2023 Monday Afternoon

### Resources:
   1. Encode: encode_utf8.md
   1. Decode: decode_utf8.md

### Review from last time if any


### UTF-8 Encoding

#### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+0001
  - 16# 0001
  - 2#  0000 0000 0000 0001

1. Determine the position of the most significant bit; let `p` be that value.
   - p = 1

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 7
   - b: 1

3. Pad/Truncate the binary string to be of length `l`
   - 2#  0000 0000 0000 0001
   - 2#             000 0001

4. Chunk the binary string into the following sizes:
   - b=1 : 
   - 2# 000 0001
   - 2# 000 0001


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

   |     1      | 0000 0001   |           |           |           |

* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 0000 0001
  - 2# 0000 0001
  - 16# 01
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`

#### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+42ef3
  - 16# 42ef3
  - 2#  0100 0010 1110 1111 0011

1. Determine the position of the most significant bit; let `p` be that value.
   - l=19

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 21
   - b: 4

3. Pad/Truncate the binary string to be of length `l`
   - 2# 0 0100 0010 1110 1111 0011

4. Chunk the binary string into the following sizes:
   - b=4:  3, 6, 6, 6
   - 2# 0 0100 0010 1110 1111 0011
   - 2# 001  |  00 0010  |  11 1011   | 11 0011


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

   -  | 1111 0xxx   | 10 xxxxxx  | 10 xxxxxx  | 10 xxxxxx  |
   -  | 1111 0001   | 10 00 0010 | 10 11 1011 | 10 11 0011 |


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# | 1111 0001   | 10 00 0010 | 10 11 1011 | 10 11 0011 |
  - 2#   1111 0001 1000 0010 1011 1011 1011 0011 
  - 16#  F182 BBB3
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`


### UTF-8 Decoding

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# F6BB BAB3
  - 2#  1111 0110   1011 1011  1011 1010  1011 0011  

1. Chunk the string into bytes
   - 2# 1111 0110  |  1011 1011  |   1011 1010  |  1011 0011  | ......

2. Determine the total number of bytes ('b') used to encode

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 1111 0110  |  1011 1011  |   1011 1010  |  1011 0011
   - b bytes: 4

3. Gather the number of bytes, 'b'.
   - 2# 1111 0110    
   - 2# 1011 1011  
   - 2# 1011 1010  
   - 2# 1011 0011

4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 1111 0 -- 110    
   - 2# 10   -- 11 1011  
   - 2# 10   -- 11 1010  
   - 2# 10   -- 11 0011
  

5. Unpack the payload by removing the framing bits
   - 2# 110 11 1011 11 1010 11 0011
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2#  0001 1011 1011 1110 1011 0011
  - 16# 1 B B D B 3



---
## Notes
<!-- This section is for students to place their notes -->
