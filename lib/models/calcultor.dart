import 'package:calculator/extension.dart';

class Calculator {
  static double num1 = 0.0;
  static double? num2;

  static void add() {
    if (num2 != null && num2 != 0) {
      num1 += num2!;
      num2 = null;
    } else {
      num2 = 0;
    }
  }

  static void pressedNumber(int number) {
    if (num2 == null) {
      num1 = num1 * 10 + number;
    } else {
      num2 = num2! * 10 + number;
    }
  }

  static String displayNumber() {
    return num2 == null ? num1.toDisplay() : num2!.toDisplay();
  }
}
