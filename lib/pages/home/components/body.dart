import 'package:calculator/models/calcultor.dart';
import 'package:flutter/material.dart';

import '../components/numeric_keypad.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Text(
          Calculator.displayNumber(),
          style: const TextStyle(fontSize: 60.0),
        ),
        const SizedBox(height: 20.0),
        NumericKeypad(),
      ],
    );
  }
}
