import 'package:calculator/extension.dart';
import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  String number = '';
  String tempNum = '';
  double? tempNum1;
  double? tempNum2;
  Operator operator = Operator.none;

  String displayNumber() {
    if (tempNum.isNotEmpty && number.isEmpty) return tempNum;
    return number.isEmpty ? '0' : number;
  }

  void pressedNumeric(int n) {
    if (number == '0') {
      number = number.substring(1);
    }
    number += n.toString();
    notifyListeners();
  }

  void clear() {
    number = '';
    tempNum = '';
    operator = Operator.none;
    tempNum1 = null;
    tempNum2 = null;
    notifyListeners();
  }

  void signed() {
    if (number.isNotEmpty && number != '0') {
      number = number[0] == '-' ? number.substring(1) : '-' + number;
      notifyListeners();
    }
  }

  void percentage() {
    double tempNum = double.parse(number);
    tempNum /= 100;
    number = tempNum.toString();
    notifyListeners();
  }

  void pressedDot() {
    if (number.isEmpty) {
      number = '0.';
    }
    if (!number.contains(r'.')) {
      number += '.';
    }
    notifyListeners();
  }

  void add() {
    if (tempNum.isEmpty) {
      tempNum = number;
    } else if (number.isNotEmpty) {
      tempNum = (double.parse(tempNum) + double.parse(number)).toDisplay();
    }
    number = '';
    operator = Operator.addition;
    notifyListeners();
  }

  void subtraction() {
    if (tempNum.isEmpty) {
      tempNum = number;
    } else if (number.isNotEmpty) {
      tempNum = (double.parse(tempNum) - double.parse(number)).toDisplay();
    }
    number = '';
    operator = Operator.subtraction;
    notifyListeners();
  }

  void multiplication() {
    if (tempNum.isEmpty) {
      tempNum = number;
    } else if (number.isNotEmpty) {
      tempNum = (double.parse(tempNum) * double.parse(number)).toDisplay();
    }
    number = '';
    operator = Operator.multiplication;
    notifyListeners();
  }

  void division() {
    if (number == '0') throw 'Divide by zero!';
    if (tempNum.isEmpty) {
      tempNum = number;
    } else if (number.isNotEmpty) {
      tempNum = (double.parse(tempNum) / double.parse(number)).toDisplay();
    }
    number = '';
    operator = Operator.division;
    notifyListeners();
  }

  void equal() {
    switch (operator) {
      case Operator.addition:
        add();
        break;
      case Operator.subtraction:
        subtraction();
        break;
      case Operator.multiplication:
        multiplication();
        break;
      case Operator.division:
        division();
        break;
    }
    notifyListeners();
  }
}

enum Operator {
  none,
  addition,
  subtraction,
  multiplication,
  division,
}
