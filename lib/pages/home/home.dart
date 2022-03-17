import 'package:calculator/models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Calculator(),
      child: Scaffold(
        appBar: AppBar(),
        body: Body(),
      ),
    );
  }
}
