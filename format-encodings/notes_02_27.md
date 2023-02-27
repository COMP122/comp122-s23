# COMP122 Lecture Notes: February 22, 2023

## Announcements:
   1. Assignment: 10-quiz-models has been graded
   1. Assignment: 41-expression to be graded
   1. Assignment: 42-checksum is deferred
      - assignment on bitwise operation is next

## Today's Agenda:
   1. Practicum:  utf8 encoding/decoding
   1. Start "Introduction to Numbering Systems"

## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am: 
     - When is the next quiz/exam?
     - In 21-encoding, encoding binary to binary -- yes, just copy?
   * M/W @ 2:00 pm: 
   * T/R @ 9:00 am:
   * T/R @ 2:00 pm: 

## Review from Last-time:
   - ???

---
# Today's Material

  1. UTF-8 Encoding : See document
     * Prerequisite: Convert the Unicode character into a binary string.
       - U+00FE
       - 16# 00FE
       - 2#  0000 0000 1111 1110 

     * Postrequisite: Decode the binary value into a hexadecimal value.
       - 2# 11000011 10111110
       - 2# 1100 0011 1011 1110
       - 16# c3be
       - validate: https://www.fileformat.info/info/unicode/char/00FE/index.htm

  1. UTF-8 Decoding : See document   
     * Prerequisite: Convert your UTF-8 string into a binary string.
       - 16# e29ca7
       - 2#  1110 0010 1001 1100 1010 0111 
     * Postrequisite: Decode the binary value into a hexadecimal value.
       - 2# 0010 0111 0010 0111
       - 16# 2727
       - U+2727

  1. Introduction to Numbering Systems 
     - See slides

---
## Resources

   1. encode_utf8.md
   1. decode_utf8.md
   1. documents/introduction-to-numbering-systems.pdf
   
---
## Notes
<!-- This section is for students to place their notes -->


