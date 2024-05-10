import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String tesSection;

  const Result({Key? key, required this.tesSection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 50)),
        Container(
          // Container sebagai latar belakang
          color: Colors.grey[200], // Warna latar belakang yang lebih cerah
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "$tesSection Test Result",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Icon(Icons.arrow_back),
        ),
      ],
    );
  }
}
