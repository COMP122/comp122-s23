public static int[] digits(int b) {
    int[] B = new int[10];  // Max 10 digit in 2^32-1

    for(int i=0; b != 0; i++ ) {
        B[i] = b % 10;
        b = b / 10;
    }
    return B;
}


public static int long_mult(int a, int b){
  int[] B = digits(b);

  int sum = 0;
  for (int d = 0 ; d < B.length ; d ++ ) {
    sum += a * B[d];
    a = a * 10 ;
  }
  return sum;
}


