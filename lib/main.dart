import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const MorseDecode());
}

class MorseDecode extends StatelessWidget {
  const MorseDecode({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse Decode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
