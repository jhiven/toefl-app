import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? textButton;
  const PrimaryButton({super.key, this.onPressed, this.textButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.black),
        elevation: MaterialStateProperty.all(2.0),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            textButton ?? "Next",
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_right,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
