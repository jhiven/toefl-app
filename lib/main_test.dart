import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/test/screens/profile_screen.dart';

void main() => runApp(TestMain());

class TestMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My App', home: Profile());
  }
}
