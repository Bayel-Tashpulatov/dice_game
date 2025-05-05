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

class _DiceGameState extends State<DiceGame> with SingleTickerProviderStateMixin {
  int leftDiceFace = 1;
  int rightDiceFace = 2;
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeDiceFace() {
    _controller.reset();
    _controller.forward();
    
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
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_animation),
                    child: ScaleTransition(
                      scale: Tween(begin: 0.8, end: 1.0).animate(_animation),
                      child: Image.asset('assets/images/Dice$leftDiceFace.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => changeDiceFace(),
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_animation),
                    child: ScaleTransition(
                      scale: Tween(begin: 0.8, end: 1.0).animate(_animation),
                      child: Image.asset("assets/images/Dice$rightDiceFace.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}