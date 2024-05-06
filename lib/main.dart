import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/screen/home_test.dart';
import 'package:toefl_app/presentation/screen/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
