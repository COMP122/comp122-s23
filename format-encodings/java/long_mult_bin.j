public static int[] binary_digits(int b) {
  int[] B = new int[32];  // Max 10 digit in 2^32-1

  for(int i=0; b != 0; i++ ) {
      B[i] = b % 2;
      b = b / 2;
  }
  return B;
}


public static int long_mult_bin(int a, int b){
  int[] B = binary_digits(b);

  int sum = 0;
  for (int d = 0 ; d < 32 ; d ++ ) {
    if (B[d] == 1) {
      sum += a;
    }
    a = a << 1;
  }
  return sum;
}