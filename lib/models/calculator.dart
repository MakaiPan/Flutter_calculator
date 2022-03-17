import 'package:calculator/extension.dart';
import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  String _number = '';
  String _tempNum = '';
  Operator operator = Operator.none;

  void delete() {
    if (_number.isNotEmpty) {
      _number = _number.substring(0, _number.length - 1);
    }
    notifyListeners();
  }

  String displayNumber() {
    if (_tempNum.isNotEmpty && _number.isEmpty) return _tempNum;
    return _number.isEmpty ? '0' : _number;
  }

  void pressedNumeric(int n) {
    if (_number == '0') {
      _number = _number.substring(1);
    }
    _number += n.toString();
    notifyListeners();
  }

  void clear() {
    _number = '';
    _tempNum = '';
    operator = Operator.none;
    notifyListeners();
  }

  void signed() {
    if (_number.isNotEmpty && _number != '0') {
      _number = _number[0] == '-' ? _number.substring(1) : '-' + _number;
      notifyListeners();
    }
  }

  void percentage() {
    double tempNum = double.parse(_number);
    tempNum /= 100;
    _number = tempNum.toString();
    notifyListeners();
  }

  void pressedDot() {
    if (_number.isEmpty) {
      _number = '0.';
    }
    if (!_number.contains(r'.')) {
      _number += '.';
    }
    notifyListeners();
  }

  void add() {
    if (_tempNum.isEmpty) {
      _tempNum = _number;
    } else if (_number.isNotEmpty) {
      _tempNum = (double.parse(_tempNum) + double.parse(_number)).toDisplay();
    }
    _number = '';
    operator = Operator.addition;
    notifyListeners();
  }

  void subtraction() {
    if (_tempNum.isEmpty) {
      _tempNum = _number;
    } else if (_number.isNotEmpty) {
      _tempNum = (double.parse(_tempNum) - double.parse(_number)).toDisplay();
    }
    _number = '';
    operator = Operator.subtraction;
    notifyListeners();
  }

  void multiplication() {
    if (_tempNum.isEmpty) {
      _tempNum = _number;
    } else if (_number.isNotEmpty) {
      _tempNum = (double.parse(_tempNum) * double.parse(_number)).toDisplay();
    }
    _number = '';
    operator = Operator.multiplication;
    notifyListeners();
  }

  void division() {
    if (_number == '0') throw 'Divide by zero!';
    if (_tempNum.isEmpty) {
      _tempNum = _number;
    } else if (_number.isNotEmpty) {
      _tempNum = (double.parse(_tempNum) / double.parse(_number)).toDisplay();
    }
    _number = '';
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
