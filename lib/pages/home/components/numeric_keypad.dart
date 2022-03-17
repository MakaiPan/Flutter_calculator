import 'package:calculator/models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumericKeypad extends StatelessWidget {
  const NumericKeypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> numericList = List.generate(9, (index) => index + 1);
    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      children: [
        OutlinedButton(
          child: const Text('AC'),
          onPressed: () => context.read<Calculator>().clear(),
        ),
        OutlinedButton(
          child: const Text('+/-'),
          onPressed: () => context.read<Calculator>().signed(),
        ),
        OutlinedButton(
          child: const Text('%'),
          onPressed: () => context.read<Calculator>().percentage(),
        ),
        OutlinedButton(
          child: const Text('÷'),
          onPressed: () {
            try {
              context.read<Calculator>().division();
            } catch (e) {
              context.read<Calculator>().clear();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${e.toString()}')));
            }
          },
        ),
        for (int i in List.generate(3, (index) => index + 1))
          OutlinedButton(
            onPressed: () => context.read<Calculator>().pressedNumeric(i),
            child: Text(i.toString()),
          ),
        OutlinedButton(
          child: const Text('×'),
          onPressed: () => context.read<Calculator>().multiplication(),
        ),
        for (int i in List.generate(3, (index) => index + 4))
          OutlinedButton(
            onPressed: () => context.read<Calculator>().pressedNumeric(i),
            child: Text(i.toString()),
          ),
        OutlinedButton(
          child: const Text('+'),
          onPressed: () => context.read<Calculator>().add(),
        ),
        for (int i in List.generate(3, (index) => index + 7))
          OutlinedButton(
            onPressed: () => context.read<Calculator>().pressedNumeric(i),
            child: Text(i.toString()),
          ),
        OutlinedButton(
          child: const Text('-'),
          onPressed: () => context.read<Calculator>().subtraction(),
        ),
        OutlinedButton(
          child: const Text('0'),
          onPressed: () => context.read<Calculator>().pressedNumeric(0),
        ),
        OutlinedButton(
          child: const Text('00'),
          onPressed: () {
            context.read<Calculator>().pressedNumeric(0);
            context.read<Calculator>().pressedNumeric(0);
          },
        ),
        OutlinedButton(
          child: const Text('.'),
          onPressed: () => context.read<Calculator>().pressedDot(),
        ),
        OutlinedButton(
          child: const Text('='),
          onPressed: () {
            try {
              context.read<Calculator>().equal();
            } catch (e) {
              context.read<Calculator>().clear();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${e.toString()}')));
            }
          },
        ),
      ],
    );
  }
}
