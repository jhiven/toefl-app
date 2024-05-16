import 'package:flutter/material.dart';

class ListeningPage extends StatelessWidget {
  const ListeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'Listening Comprehension',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              'Section Preparation',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            Container(
              child: const Text(
                'In this section of the test, you will have an opportunity to demonstrate your ability to understand conversations and talks in English. There are three parts to this section with special directions for each part. Answer all the questions on the basis of what is stated or implied by the speakers in this test. When you take the actual TOEFL test, you will not be allowed to take notes or write in your test book.',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
