import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CheckButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Check',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50), // Lebar tombol mengisi layar
      ),
    );
  }
}
