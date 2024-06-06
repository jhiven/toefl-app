import 'package:flutter/material.dart';

class Rangking extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final bool isMe;

  const Rangking({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          height: 60,
          child: SizedBox(
            width: 40,
            child: Center(
              child: Text(
                "$rank",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(8.0),
              border: isMe
                  ? Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.5,
                    )
                  : null,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Color(0xFF14487A),
                  size: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isMe ? 'You' : name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$score",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
