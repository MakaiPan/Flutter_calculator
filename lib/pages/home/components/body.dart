import 'package:calculator/models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/numeric_keypad.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  double _startDragPoint = 0;
  bool _isDelete = false;
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        GestureDetector(
          onHorizontalDragStart: (details) {
            _isDelete = false;
            _startDragPoint = details.localPosition.dx;
          },
          onHorizontalDragUpdate: (details) {
            if (!_isDelete && details.localPosition.dx > _startDragPoint + 50) {
              context.read<Calculator>().delete();
              _isDelete = true;
            }
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              context.watch<Calculator>().displayNumber(),
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 60.0),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        NumericKeypad(),
      ],
    );
  }
}
