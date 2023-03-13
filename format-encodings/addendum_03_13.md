# COMP122 Addendum Notes: March 13, 2023

## On the fly examples:

### ASCII Encode Table Monday Morning

  1. Task:
     Print out the ASCII table for the printable characters
       - 33 is the first printable character
       - 126 is the last printable character
       - Example output for one row:   `!: 33, 21`

  1. Java Code

  ```java
  for(int i=33; i <= 126; i++) {
    mips.print_c(i);
    mips.print_ci(':');
    mips.print_ci(' ');
    mips.print_d(i),
    mips.print_ci(',');
    mips.print_ci(' ');
    mips.print_x(i);
    mips.print_ci('\n');
  }
  ```

  1. Java TAC
  ```java tac
  init: ;
        int i = 33;
        int $l = i;  
        int $r = 126;
  loop: for(; $l <= $r; i++) {
           // body
           mips.print_c(i);
           mips.print_ci(':');
           mips.print_ci(' ');
           mips.print_d(i);
           mips.print_ci(',');
           mips.print_ci(' ');
           mips.print_x(i);
           mips.print_ci('\n');
           //
   next:   ;
           i++;
           $l = i;  
           $r = 126;

           continue;
        }
  done: ;
  ```

  1. MIPS (Test from ~/classes/comp122/mips)
  ```mips
            .text
            .include "macros/syscalls.s"


     # Book Keeping
     # t0:  i
     # t1:  $l
     # t2:  $r


     init: nop                  # init: ;
           li $t0, 33           #       int i = 33;
           move $t1, $t0        #       int $l = i;  
           li $t2, 126          #       int $r = 126;
     loop: bgt $t1, $t2, done   # loop: for(; $l <= $r; i++) {
                                #          // body
             print_c($t0)       #          mips.print_c(i);
             print_ci(':')      #          mips.print_ci(':');
             print_ci(' ')      #          mips.print_ci(' ');
             print_d($t0)       #          mips.print_d(i);
             print_ci(',')      #          mips.print_ci(',');
             print_ci(' ')      #          mips.print_ci(' ');
             print_x($t0)       #          mips.print_x(i);
             print_ci('\n')     #          mips.print_ci('\n');
                                #          //
      next:  nop                #  next:   ;
             addi $t0, $t0, 1   #          i++;

             move $t1, $t0      #          $l = i;  
             li $t2, 126        #          $r = 126;                                

                                # 
            b loop              #          continue;
                                #       }
     done:                      # done: ;


  ```

  

### Count down
  1. Task:
     Given a number, say 4, in $a0, print out a countdown from 4
     Then end the output with a bang!
  1. mars prog.s
     4
     3
     2
     1
     !

  1. Java Code
  ```java
   // $a0 has the input value

   for (int i = $a0; i > 0; i--) {
      mips.print(i);
      mips.print_ci('\n');
   }
   mips.print_ci('!');
   mips.print_ci('\n');

  ```

  1. Java TAC
  ```java tac
   // $a0 has the input value

            //--------------
  init:     ;
            int i = $a0;
            ; // l-r eval
            int $l = i;
            int $r = 0;

  ernie:    for (;  $l > $r  ;) {
               mips.print(i);
               mips.print_ci('\n');
  bert:        i--;
  bb:          ;  //left-right eval
              int $l = i;
              int $r = 0;
              continue;
            }
  done:     ;
            //--------------------
            mips.print_ci('!');
            mips.print_ci('\n');

  ```

  1. MIPS
  ```mips
   # $a0 has the input value
   move $t0, $a0

   # Bookkeeping
   # t0 : $a0
   # t1 : i
   # t2 : $l
   # t3 : $r


                          
  init:  nop                   # ;
         move $t1, $t0         # int i = $a0;
         nop                   # ; // l-r eval
         move $t2, $t1         # int $l = i;
         li $t3, 0             # int $r = 0;
     
  ernie: blt $t2, $t3, done    # for (;  $l > $r  ;) {
           print($t1)          #    mips.print(i);
           print_ci('\n')      #    mips.print_ci('\n');
  bert:    subi $t1, $t1, 1    #    i--;
  bb:      nop                 #    ;  //left-right eval

           move $t2, $t1       # int $l = i;
           li $t3, 0           # int $r = 0;

           b ernie             #   continue;
                               # }
  done: nop                    # ;
        print_ci('!')          # mips.print_ci('!');
        print_ci('\n')         # mips.print_ci('\n');

  ```

  

### Summation
  1. Java Code
  ```java
  ```

  1. Java TAC
  ```java tac
  ```

  1. MIPS
  ```mips
  ```

### Reduction
  1. Java Code
  ```java
  ```

  1. Java TAC
  ```java tac
  ```

  1. MIPS
  ```mips
  ```


