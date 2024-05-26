import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/test/screens/test_layout.dart';
import 'package:toefl_app/presentation/test/widgets/audio_player.dart';

class PreparationPage extends StatelessWidget {
  final String heading;
  final String desc;
  final String? url;

  const PreparationPage({
    super.key,
    required this.heading,
    required this.desc,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return TestLayout(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Section Preparation',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (url != null) AudioPlayerWidget(url: url!),
          ],
        ),
      ),
    );
  }
}
