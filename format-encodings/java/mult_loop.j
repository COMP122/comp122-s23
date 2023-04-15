public static int mult_loop(int a, int b) {

      int $v0 = 0;
      for(int i = 1 ; i <= b; i++){
 add:   $v0 = $v0 + a;
      }
      return $v0;
}
