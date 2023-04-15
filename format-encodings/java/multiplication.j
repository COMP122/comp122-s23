public static int multiplication(int a, int b){
  // Algorithmic Complexity: O(word_size)

  int sum = 0;
  int bit = 0;

  for (; b != 0 ; ) {
    // pop off a bit from b
    bit = b & 0x01;  
    b = b >>> 1;

    if ( bit == 1 ) {
      sum += a;
    }
    a = a << 1;
  }
  return sum;
}
