import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlipcardWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final String content;
  final double contentSize;

  const FlipcardWidget({super.key, required this.title, required this.color, required this.textColor, required this.content, required this.contentSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15).copyWith(bottom: 50, top: 30),
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Color.fromRGBO(20, 72, 122, 1),
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: kElevationToShadow[4],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: textColor,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  content,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: contentSize,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
