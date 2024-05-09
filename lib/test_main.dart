import 'package:flutter/material.dart';
import 'package:toefl_app/learn/pages/learn_method_page.dart';
import 'package:toefl_app/learn/pages/listening_test_page.dart';
import 'package:toefl_app/learn/pages/listening_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AudioPage(),
      );
  }
}