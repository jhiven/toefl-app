import 'package:flutter/material.dart';

class BottomBackground extends StatelessWidget {
  const BottomBackground({super.key, required this.butoon1, required this.button2});
  final Widget butoon1;
  final Widget button2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: butoon1,
            ),
            button2,
          ],
        ),
      ),
    );
  }
}
