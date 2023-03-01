# COMP122 Addendum File: February 27, 2023 Tuesday Afternoon

### Resources:
   1. Encode: encode_utf8.md
   1. Decode: decode_utf8.md

### Review from last time if any


### UTF-8 Encoding

#### Example
* Prerequisite: Convert the Unicode character into a binary string.
  - U+13FED
  - 16# 13FED
  - 2#  0001 0011 1111 1110 1101

1. Determine the position of the most significant bit; let `p` be that value.
   - p=17

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 21
   - b: 4

3. Pad/Truncate the binary string to be of length `l`
   - 2# 0 0001 0011 1111 1110 1101

4. Chunk the binary string into the following sizes:
   - b=4 : 3, 6, 6, 6
   - 2# 0 0001 0011 1111 1110 1101
   - 2# 000 |  01-0011 |   11-1111 | 10-1101


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

   - | 1111 0xxx   | 10 xxxxxx  | 10 xxxxxx  | 10 xxxxxx  |
   - | 1111 0000   | 10 01-0011 | 10 11-1111 | 10 10-1101 |


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# | 1111 0000   | 10 01-0011 | 10 11-1111 | 10 10-1101 |
  - 2#   1111 0000 1001 0011 1011 1111 1010 1101 
  - 16# F093 BFAD
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`



#### Example


* Prerequisite: Convert the Unicode character into a binary string.
  - U+15CA
  - 16# 15CA 
  - 2#  0001 0101 1100 1010

1. Determine the position of the most significant bit; let `p` be that value.
   - p=13

2. Determine the value of `l` (length) and `b` (bytes)
   - l: 16
   - b: 3

3. Pad/Truncate the binary string to be of length `l`
   - 2# 0001 0101 1100 1010
   - 2# 0001 0101 1100 1010

4. Chunk the binary string into the following sizes:
   - b=3 : 4, 6, 6 
   - 2# 0001 0101 1100 1010
   - 2# 0001 |  01-0111 |  00-1010


5. Pack your chunks into b bytes with the framing bits

   |  b bytes   | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|----------:|
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |

 - | 1110 xxxx   | 10 xxxxxx   | 10 xxxxxx  | 
 - | 1110 0001   | 10 01-0111  | 10 00-1010 | 

* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 
  - 2# 
  - 16# 
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`



### UTF-8 Decoding

### Example

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# D9BA 65ED 99BF
  - 2#  1101 1001 1011 1010 0110 0101 1110 1101 1001 1001 1011 1111

1. Chunk the string into bytes
   - 2# 1101 1001 |  1011 1010 |  ->  |  0110 0101 |  1110 1101 | 1001 1001 | 1011 1111

2. Determine the total number of bytes ('b') used to encode

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 1101 1001 |  1011 1010 |
   - b bytes

3. Gather the number of bytes, 'b'.

4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 110 - 1 1001
   - 2# 10  - 11 1010
  

5. Unpack the payload by removing the framing bits
   - 2# 1 1001 11 1010
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2#   0110 0111 1010
  - 16#  67A


#### Example

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# 
  - 2#  

1. Chunk the string into bytes
   - 2# 

2. Determine the total number of bytes ('b') used to encode

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 
   - b bytes

3. Gather the number of bytes, 'b'.

4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 
   - 2# 
   - 2# 
  

5. Unpack the payload by removing the framing bits
   - 2# 
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 
  - 16# 
---
## Notes
<!-- This section is for students to place their notes -->
