import 'package:flutter/material.dart';

// Widget untuk menampilkan kotak dalam GridView
class BoxItem extends StatelessWidget {
  final String text;

  const BoxItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 193, 227, 255),
        borderRadius: BorderRadius.circular(15), // Radius di sini
      ),
      margin: EdgeInsets.all(12),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
