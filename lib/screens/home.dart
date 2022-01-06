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

  bool _isPressed = false;

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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Morse Interpreter",
              style: TextStyle(color: Colors.amber, fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: GestureDetector(
                    onTap: _point,
                    onLongPress: _line,
                    onLongPressStart: (details) {
                      setState(() {
                        _isPressed = true;
                      });
                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        _isPressed = false;
                      });
                    },
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      child: const Text(
                        "TAP OR LONG PRESS",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                        color: _isPressed ? Colors.blue : Colors.amber,
                        shape: BoxShape.circle,
                      ),
                    ))),
            Text(
              input.isNotEmpty ? input : "",
              style: const TextStyle(color: Colors.amber, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              output.isNotEmpty ? output : "Waiting...",
              style: const TextStyle(color: Colors.amber, fontSize: 28),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    input = "";
                    output = "";
                  });
                },
                child: const Text(
                  "CLEAR",
                  style: TextStyle(
                      fontSize: 24, color: Colors.red, letterSpacing: 1.5),
                ))
          ],
        ),
      ),
    );
  }
}
