import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceGame(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftDiceFace = 1;
  int rightDiceFace = 2;
  void changeDiceFace() {
    setState(() {
      leftDiceFace = Random().nextInt(6) + 1;
      rightDiceFace = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dice Game",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.amber.shade400,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => changeDiceFace(),
                    child: Image.asset('assets/images/Dice$leftDiceFace.png'),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => changeDiceFace(),
                    child: Image.asset("assets/images/Dice$rightDiceFace.png"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
