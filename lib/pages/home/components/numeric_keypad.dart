import 'package:flutter/material.dart';

class NumericKeypad extends StatelessWidget {
  const NumericKeypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      children: [
        OutlinedButton(
          child: Text('AC'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('+/-'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('%'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('÷'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('1'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('2'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('3'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('×'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('4'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('5'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('6'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('-'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('7'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('8'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('9'),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text('+'),
          onPressed: () {},
        ),
      ],
    );
  }
}
