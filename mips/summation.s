	.include "macros/syscalls.s"
	
	
	li $a0, 4


summantion:

  # bookkeeping
  # t1: $a0
  # t2: i
  # t3: $l
  # t4: $r
  # t5: sum
  
  # De-marshall my inputs
  move $t1, $a0
  
  
                                # int sum = 0;
  init: nop                     # ;
        li $t2, 1               # int i = 1
        move $t3, $t2           # $l = i;
        move $t4, $a0           # $r = $a0;

  sam:  bge $t3, $t4, done      # for(; $l < $r ;) {
  body:    nop                  #   ;  
           add $t5, $t5, $t2    #   sum += i;
  next:    nop                  #   ;
           addi $t2, $t2, 1     #   i++;
           move $t3, $t2        #   $l = i;
           move $t4, $t1        #   $r = $a0;
        b sam                   #   continue;
                                # }
  done: nop                     # ;
        print_d($t5)            # mips.print_d(sum);
        jr $ra