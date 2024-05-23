import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  const PrimaryButton(
      {super.key, required this.text, required this.icon, this.onPressed});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            text,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const Spacer(),
          if (icon != null)
            Icon(
              icon!,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
        ],
      ),
    );
  }
}
