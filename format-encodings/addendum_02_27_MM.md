# COMP122 Addendum File: February 27, 2023 Monday Morning

### Resources:
   1. Encode: encode_utf8.md
   1. Decode: decode_utf8.md

### Review from last time if any


### UTF-8 Encoding

#### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+1111
  - 16# 1111
  - 2#  0001 0001 0001 0001

1. Determine the position of the most significant bit; let `p` be that value.
   - 13

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 16
   - b: 3

3. Pad/Truncate the binary string to be of length `l`
   - 2# 0001 0001 0001 0001

4. Chunk the binary string into the following sizes:
   - b=3 : 4, 6, 6
   - 2# 0001 0001 0001 0001
   - 2# 0001 | 0001 00  | 01 0001


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   | ->  3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

   | -->        | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   | -->        | 1110 0001   | 10 0001 00 | 10 01 0001 |           |



* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# | 1110 0001   | 10 0001 00 | 10 01 0001 |
  - 2# 1110 0001 1000 0100 1001 0001
  - 16# E18491
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`


#### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+D07A
  - 16# D07A
  - 2#  1101 0000 0111 1010

1. Determine the position of the most significant bit; let `p` be that value.
   - 16

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 16
   - b: 3

3. Pad/Truncate the binary string to be of length `l`
   - 2# 1101 0000 0111 1010

4. Chunk the binary string into the following sizes:
   - b=3 : 4,6,6
   - 2# 1101 0000 0111 1010
   - 2# 1101 |  0000 01  | 11 1010


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |  >  3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

  
  -  |  >  3      | 1110 xxxx   | 10 xxxx xx  | 10 xx xxxx |           |
  -  |  >  3      | 1110 1101   | 10 0000 01  | 10 11 1010 |           |


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# | 1110 1101   | 10 0000 01  | 10 11 1010 |   
  - 2#   1110 1101 1000 0001  1011 1010 
  - 16#  E D 8 1 B A
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`

### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+
  - 16# 
  - 2#  

1. Determine the position of the most significant bit; let `p` be that value.
   - 

2. Determine the value of `l` (length) and `b` (bytes)
   - l:
   - b:

3. Pad/Truncate the binary string to be of length `l`
   - 2# 

4. Chunk the binary string into the following sizes:
   - b :
   - 2# 
   - 2# 


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | ffff 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | fff0 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | ff0x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |



* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 
  - 2# 
  - 16# 
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`



### UTF-8 Decoding

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# DD9B FFFF
  - 2#  1101 1101 1001 1011 1111 1111 1111 1111

1. Chunk the string into bytes
   - 2# 1101 1101  |   1001 1011 | 1111 1111 | 1111 1111

2. Determine the total number of bytes ('b') used to encode

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 1101 
   - b bytes: 2

3. Gather the number of bytes, 'b'.
   - 2# 1101 1101
   - 2# 1001 1011


4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 110 - 1 1101
   - 2# 10 - 01 1011
  

5. Unpack the payload by removing the framing bits
   - 2# 1 1101 01 1011
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2#    0111 0101 1011
  - 16#   075b



---
## Notes
<!-- This section is for students to place their notes -->
