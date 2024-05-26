import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/test/screens/reading_question.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // WrittenInstruction(),
        // WrittenQuestion(),
        ReadingQuestion(),
      ],
    );
  }
}
