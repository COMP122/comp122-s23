# COMP122 Addendum File: February 27, 2023 Tuesday Afternoon

### Resources:
   1. Encode: encode_utf8.md
   1. Decode: decode_utf8.md

### Review from last time if any


### UTF-8 Encoding
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
   |     4      | 1111 0xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |
   |     3      | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   |     2      | 110x xxxx   | 10 xxxxxx |           |           |
   |     1      | 0xxx xxxx   |           |           |           |



* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 
  - 2# 
  - 16# 
  - validate: `https://www.fileformat.info/info/unicode/char/<XXX>/index.htm`



### UTF-8 Decoding

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
