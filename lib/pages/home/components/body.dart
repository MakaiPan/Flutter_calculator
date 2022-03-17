import 'package:calculator/models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          context.watch<Calculator>().displayNumber(),
          style: const TextStyle(fontSize: 60.0),
        ),
        const SizedBox(height: 20.0),
        NumericKeypad(),
      ],
    );
  }
}
