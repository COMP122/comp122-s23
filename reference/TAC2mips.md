## Resources

  * TAC Instructions and Corresponding MIPS Instructions
    - see also: ~/classes/comp122/reference/MIPS-cheatsheet.pdf
    - `MIPS <op_i>  <- Java operator`
      * addi: +, subi: -, ori: |, andi: &, xori: ^
    - `MIPS <op>  <- Java operator`
      * add: +, sub: -, or: |, and: &, xor: ^,


      | TAC Equations                 | MIPS Instructions         |
      |-------------------------------|---------------------------|
      | `;`                           | `nop`                     |
      | `x = imm;`                    | `li x, imm`               |
      | `x = - imm`                   | `subi x, $zero, imm`      |
      | `x = - a`                     | `sub  x, $zero, a`        |
      | `x = a;`                      | `move x, a`               |
      | `x = a <op_i> imm; `          | `<op_i> x, a, imm`        |
      | `x = a <op> b;`               | `<op> x, a, b`            |
      | `x = ~ a`                     | `nor x, a, $zero`         |
      | `x = a >>> imm;`              | `srl x, a, imm`           |
      | `x = a >> imm;`               | `sra x, a, imm`           |
      | `x = a << imm;`               | `sll x, a, imm`           |
      | `x = a >>> b;`                | `srlv x, a, b`            |
      | `x = a >> b;`                 | `srav x, a, b`            |
      | `x = a << b;`                 | `sllv x, a, b`            |

      | TAC Mult / Div Equations      | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = a * b;`                  | `mult a, b`               |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a / b;`                  | `div a, b`                |
      |                               | `mflo x`                  |
      |                               |                           |
      | `x = a % b;`                  | `div a, b`                |
      |                               | `mfhi x`                  |
      |                               |                           |

      | TAC Mult/Div Psuedo Equations | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = a * b;`                  | `mul x, a, b`             |
      | `x = a / b;`                  | `div x, a, b`             |
      | `x = a % b;`                  | `rem x, a, b`             |


      | TAC String Equations          | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = A[imm];`                 | `la p, A`                 |
      |                               | `lb x, imm(p)`            |
      |                               |                           |
      | `x = A[v];`                   | `la p, A`                 |
      |                               | `add p, p, v`             |
      |                               | `lb x, 0(p)`              |
      |                               |                           |
      | `A[imm] = x;`                 | `la p, A`                 |
      |                               | `sb x, imm(p)`            |
      |                               |                           |
      | `A[v] = x;`                   | `la p, A`                 |
      |                               |                           |
      |                               | `add p, p, v`             |
      |                               | `sb x, 0(a)`              |
      |                               |                           |
      | `x = & A;`                    | `la x, A`                 |
      | `x = (* p);`                  | `lb x, 0(p)`              |
      | `(* p) = x;`                  | `sb x, 0(p)`              |

    - Control flow labels
      * $cons: the consequence for an if-then-else statement
      * $alt:  the alternative for an if-then-else statement
      * $done: the statement after the control-flow statement
      * $loop: the conditional statement associated with a loop statement

      | TAC Control Flow              | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `label: ;`                    | `label: nop`              |
      | `if (a <cond> b) {`           | `b<! cond> a, b, $alt`    |
      | `} else {`                    | `# end of block`          |
      | `for(; a <cond> b ;) {`       | `b<! cond> a, b, $done`   |
      | `while(a <cond> b) {`         | `b<! cond> a, b, $done`   |
      | `continue label;`             | `b label`                 |
      | `// break;`                   | `b $done`                 |
      | `break;`                      | `b $done`                 |
      | `}`                           | `# end of block`          |
      |                               |                           |
      | `if (a <cond> b) break;`      | `b<cond> a, b, $done`     |
      | `if (a <cond> b) continue;`   | `b<cond> a, b, $loop`     |




      | `TAC <cond>` | `MIPS <cond>` | `MIPS <! cond>` |`TAC <! cond>` |
      |:------------:|:-------------:|:---------------:|:-------------:|
      | `<`          | `lt`          | `ge`            |  `>=`         |
      | `<=`         | `le`          | `gt`            |  `>`          |
      | `!=`         | `ne`          | `eq`            |  `==`         |
      | `==`         | `eq`          | `ne`            |  `!=`         |
      | `>=`         | `ge`          | `lt`            |  `<`          |
      | `>`          | `gt`          | `le`            |  `>=`         |
   

      | JAVA: MIPS OS Interface       | MIPS Macro                |
      |-------------------------------|---------------------------|
      | `mips.print_t(a);`            | `print_t(a)`              |
      | `mips.print_ti(imm);`         | `print_ti(imm)`           |
      | `mips.print_c(a);`            | `print_c(a)`              |
      | `mips.print_ci(imm);`         | `print_ci(imm)`           |
      |  See printf:                  | etc., etc., etc.,         |
