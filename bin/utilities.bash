#! /bin/bash



function base2 () {
  for i in "$@" ; do 
    hex=$(printf "%x" $(( $i )) )
    bin=
    for (( i = 0 ; i < ${#hex} ; i++ )) ; do
        case ${hex:$i:1} in 
            0)   bin="${bin}0000" ;;
            1)   bin="${bin}0001" ;;
            2)   bin="${bin}0010" ;;
            3)   bin="${bin}0011" ;;
            4)   bin="${bin}0100" ;;
            5)   bin="${bin}0101" ;;
            6)   bin="${bin}0110" ;;
            7)   bin="${bin}0111" ;;
            8)   bin="${bin}1000" ;;
            9)   bin="${bin}1001" ;;
            a|A) bin="${bin}1010" ;;
            b|B) bin="${bin}1011" ;;
            c|C) bin="${bin}1100" ;;
            d|D) bin="${bin}1101" ;;
            e|E) bin="${bin}1110" ;;
            f|F) bin="${bin}1111" ;;
        esac
    done
    printf "0b%s " $bin
  done
  printf "\n"
}

function base8 () {

  for i in $@ ; do 
        printf "0%o " $(( $i ))
  done
  printf "\n"
}

function base16 () {

  for i in $@ ; do 
        printf "%d " $(( $i ))
  done
  printf "\n"
}


function base16 () {

  for i in $@ ; do 
        printf "0x%x " $(( $i ))
  done
  printf "\n"
}


function ascii.index () {
    str="$*"
    for (( i = 0; i < ${#str}; i++ )) ; do 
        printf "%d " "'${str:i:1}"
    done
    printf "\n"
}

function ascii.char () {
   for i in $@   ; do 
       printf \\$(printf '%03o' $(( $i )) )
   done
   printf "\n"
}




