# Floating Point Encoding

## Algorithm
The following steps can be used to convert a binary number represented in scientific notation to to IEEE floating point format.

  - These steps are provided to facilitate the development of a computer program.
  - A set of examples are also provided at the end of this document.  These examples are couched as a paper-based exercise


* Prerequisite:
  1. Convert the number into binary real number: `- 101011.010101`
  1. Represent the number in scientific notation: `- 1.01011010101 x 2^ 101`
  1. Parse the number to identify the following components:
       1. the sign of the number: `-`
       1. the coefficient of the number: `1.01011010101`
       1. the sign of the exponent: `+`
          (note that the sign is implicit in this example)
       1. the exponent: `101`

1. Read the four components into registers.
   1. the sign as an ASCII character: `-`
   1. the coefficient of the number in fix point: `101011010101`
      - the radix point is set after the first digit from the left.
   1. the sign of the exponent as an ASCII character: `+`
   1. the value of exponent as an unsigned integer

1. Encode each of the three fields of the floating point format:
   1. Sign: 
      - Set to `1` if '-', otherwise set to `0` otherwise
   2. Exponent:
      - Convert the exponent to a signed integer
        * Set to `- exponent` if '-', otherwise set to `exponent`
      - Add the bias to the exponent, say 127 for binary32.
   3. Mantissa: 
      - Determine the number of bits in the coefficient
        * i.e., determine the position of the MSb of the coefficient
      - Shift the coefficient number to the left, until the MSb of the coefficient is removed
        * the mantissa, which represents a fractional value is now left justified in the register

1. Consider the format of binary32, a floating point format

   | Sign (1) | Exponent (8)  | Mantissa (23)                | 
   | --------:| :-----------: | :--------------------------- | 
   |  x       |   xxxx xxxx   | xxxx xxxx xxxx xxxx xxxx xxx |

1. Shift the each of the three fields into their proper location.<br>
   For binary32, this is accomplished via the following three statements together.
   * sign = sign   << 31;  // (23+8)
   * expon = expon << 23;
   * mantissa = mantissa >>> 9 (1 + 8);

1. Merge the three fields together
   * $v0 = sign | expon | mantissa;

---

* The following table enumerates key information associated with each IEEE floating point formats.  This information includes:
  - the total number of bits used to represent the floating point value
  - the number of bits used to represent each field
  - the bias for the encoding of the exponent


|Encoding |Total|Sign|Exponent|Mantissa| Binary Bias      |Decimal Bias |
|---------|----:|:--:|-------:|-------:|-----------------:|------------:|
|Binary16 |  16 |  1 |      5 |     10 |           `01111`|          15 |
|Binary32 |  32 |  1 |      8 |     23 |        `01111111`|         127 |
|Binary64 |  64 |  1 |     11 |     52 |     `01111111111`|        1023 |
|Binary128| 128 |  1 |     15 |    112 | `011111111111111`|       16383 |

 * The format for all IEEE floating point numbers is the concatenation of each of the following fields in order: the sign, exponent, the mantissa.

   - For example, the Binary32 (a Java float) encoding has the following format

     |Sign (1)|Exponent (8) |Mantissa (23)                | 
     |-------:|:-----------:|:--------------------------- | 
     |   x    |  xxxx xxxx  |xxxx xxxx xxxx xxxx xxxx xxx |

   - Note that you need to pad/truncate values 
     - Pad/truncate the exponent from the left
     - Pad/truncate the mantissa from the right

----
# Examples for `- 1.01011010101 x 2^101`

* Identify the components
  - the sign of the number: `-`
  - the coefficient of the number: `1.01011010101`
  - the sign of the exponent: `+`
  - the exponent: `101`

* Determine the value of the mantissa: `01011010101`  
  - note that this value must always be left justified

* Based upon the encoding:
  - recalculate the exponent using the correct bias
  - pad/truncate fields to fit into the defined fields

1. Binary16 (half):
   - Sign: `1`
   - Expon: `101` (5) -->  `10100` (20 = 5 + 15)
   - Mantissa: `01011010101` --> `0101101010` 
   - Note: precision is lost via this encoding scheme

     | S   | E (5)   | M (10)       | 
     | --: | :-----: | :----------- | 
     | 1   |  10100  | 0101 1010 10 | 

2. Binary32 (single):   
   - Sign: `1`
   - Expon: `101` (5) -->  `1000 0100` (132 = 5 + 127)
   - Mantissa: `01011010101` --> `010110101010000..0` 

     | S   | E (8)      | M (23)  | 
     | --: | :---------:| :------ | 
     | 1   |  1000 0100 | 0101 1010 1010 0000 0000 000 | 

3. Binary64 (double):
   - Sign: `1`
   - Expon: `101` (5) -->  `100 0000 0100` (1028 = 5 + 1023)
   - Mantissa: `01011010101` --> `0101 1010 1010 0000 00000000 00000000 00000000 000000 0000` 

     | S   | E (11)        | M (52) | 
     | --: | :------:      | :----- | 
     | 1   | 100 0000 0100 | 0101 1010 1010 0000 00000000 00000000 00000000 000000 0000 | 


4. Binary128 (quad)
   - Sign: `1`
   - Expon: `101` (5) -->  `100 0000 0000 0100` (16388 = 5 + 16383)
   - Mantissa: `01011010101` -->
     - <sup><sub>`0101 1010 1010 0000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0` </sup></sub>

     | S   | E (15)  | M (122)                         | 
     | --: | :------:| :------------------------------ | 
     | <sup><sub> 1 </sub></sup> |  <sup><sub>100 0000 0000 0100</sub></sup> | <sup><sub> 0101 1010 1010 0000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0</sub></sup> |
