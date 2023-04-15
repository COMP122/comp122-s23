
class MIPS_OS_Interface {

  static int $sp = -1;
  static int[] stack= new int[256];


  public void push(int register) {
    $sp = $sp + 1;
    stack[$sp] = register;
  }
  public int pop() {
    int x = stack[$sp];
    $sp = $sp - 1; 
    return x;
  }
  public void print_d(int register) {
    System.out.printf("%d", register);
    return;
  }
  public void print_di(int immediate  ) {
    System.out.printf("%d", immediate);
    return;
  }

  public static void print_c(char register) {
    System.out.printf("%c", register);
    return;
  }
  public static void print_ci(char immediate) {
    System.out.printf("%c", immediate);
    return;
  }

  public static void print_s(String register) {
    System.out.printf("%s", register);
    return;
  }

  public static void print_t(int register) {

    StringBuilder binaryValue = new StringBuilder();
    String binaryString;
    long value = Integer.toUnsignedLong(register);  // Java does not have unsigned
    long remainder;

    while (value > 0) {
        remainder = value % 2;
        value     = value / 2;
        binaryValue.append(remainder);
    }
    binaryString = binaryValue.reverse().toString();
    for (int i=32; i > binaryString.length(); i--) {
      System.out.printf("%c", '0');
    }
    System.out.printf("%s", binaryString);
    return;
  }
  public static void print_ti(int immediate) {
    print_t(immediate);
    return;
  }


  public static void exit(int register) {
    System.exit(register);
    return;
  }
  public static void exiti(int immediate) {
    System.exit(immediate);
    return;
  }


  public static int u_byte(byte value) {
    return Byte.toUnsignedInt(value);
  }
  public static int s_byte(byte value) {
    return value;
  }

  public static int u_half(short value) {
    return Short.toUnsignedInt(value);
  }
  public static int s_half(short value) {
    return value;
  }

}
