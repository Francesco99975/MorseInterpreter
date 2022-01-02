import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final morseCode = <String, String>{
    "-": "t",
    "--": "m",
    "---": "o",
    "-----": "0",
    "----.": "9",
    "---..": "8",
    "--.": "g",
    "--.-": "q",
    "--..": "z",
    "--..--": ",",
    "--...": "7",
    "-.": "n",
    "-.-": "k",
    "-.--": "y",
    "-.--.": "(",
    "-.--.-": ")",
    "-.-.": "c",
    "-.-.--": "!",
    "-..": "d",
    "-..-": "x",
    "-..-.": "/",
    "-...": "b",
    "-....": "6",
    "-....-": "-",
    ".": "e",
    ".-": "a",
    ".--": "w",
    ".---": "j",
    ".----": "1",
    ".--.": "p",
    ".--.-.": "@",
    ".-.": "r",
    ".-.-.-": ".",
    ".-..": "l",
    "..": "i",
    "..-": "u",
    "..---": "2",
    "..--..": "?",
    "..-.": "f",
    "...": "s",
    "...-": "v",
    "...--": "3",
    "....": "h",
    "....-": "4",
    ".....": "5"
  };

  String input = "";
  String output = "";
  Timer _timer = Timer.periodic(const Duration(days: 30), (_) {});

  _point() {
    try {
      _timer.cancel();
    } finally {
      setState(() {
        input += '.';
      });
      _timer = Timer.periodic(const Duration(seconds: 3), _tryParse);
      print(input);
      print(_timer.isActive);
    }
  }

  _line() {
    try {
      _timer.cancel();
    } finally {
      setState(() {
        input += '-';
      });
      _timer = Timer.periodic(const Duration(seconds: 3), _tryParse);
      print(input);
      print(_timer.isActive);
    }
  }

  _tryParse(Timer timer) {
    if (morseCode.containsKey(input)) {
      setState(() {
        output += morseCode[input] as String;
        input = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: InkWell(
              onTap: _point,
              onLongPress: _line,
              child: const CircleAvatar(
                backgroundColor: Colors.amber,
              ),
            )),
            Text(
              output.isNotEmpty ? output : "Text Here",
              style: const TextStyle(color: Colors.amber, fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
