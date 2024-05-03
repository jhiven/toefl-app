import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/listening_screen.dart';
import 'package:toefl_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: appTheme,
      home: const Scaffold(
        body: ListeningPage(),
      ),
    );
  }
}
