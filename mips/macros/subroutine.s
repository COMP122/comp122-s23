.macro save_state()
       push($gp, $sp, $fp, $ra)
       push_t_registers()
.end_macro

.macro restore_state()
       pop_t_registers()
       pop($gp, $sp, $fp, $ra)
.end_macro


.macro demarshal_results()
.end_macro

.macro demarshal_results(%v0)
       nop                      # Demarshaling Return Values
       move %v0, $v0            # On MIPS, the first return value is in $v0
.end_macro

.macro demarshal_results(%v0, %v1)
       nop                      # Demarshaling Return Values
       move %v0, $v0            # On MIPS, the first return value is in $v0
       move %v1, $v1            # On MIPS, the second return value is in $v1
.end_macro

.macro marshal_args()
.end_macro
.macro marshal_args(%a0)
        nop                     # Marshaling Input Args
        move $a0, %a0           # On MIPS, the first four args are in registers
.end_macro
.macro marshal_args(%a0,%a1)
        nop                     # Marshaling Input Args
        move $a0, %a0           # On MIPS, the first four args are in registers
        move $a1, %a1
.end_macro
.macro marshal_args(%a0,%a1,%a2)
        nop                     # Marshaling Input Args
        move $a0, %a0           # On MIPS, the first four args are in registers
        move $a1, %a1
  move $a2, %a2
.end_macro
.macro marshal_args(%a0,%a1,%a2,%a3)
        nop                     # Marshaling Input Args
        move $a0, %a0           # On MIPS, the first four args are in registers
        move $a1, %a1
        move $a2, %a2
        move $a3, %a3
.end_macro
.macro marshal_args(%a0,%a1,%a2,%a3,%a4)
        nop                     # Marshaling Input Args
        move $a0, %a0           # On MIPS, the first four args are in registers
        move $a1, %a1
        move $a2, %a2
        move $a3, %a3
        nop                     # Remaining Args go on the Stack
        push(%a4)               
.end_macro