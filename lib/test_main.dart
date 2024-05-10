import 'package:flutter/material.dart';
import 'package:toefl_app/test_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
