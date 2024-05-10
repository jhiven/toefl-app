import 'package:flutter/material.dart';
import 'package:toefl_app/presentation/screens/written_question.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  const PrimaryButton({super.key, required this.text, required this.icon});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
            widget.text,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const Spacer(),
          if (widget.icon != null)
            Icon(
              widget.icon!,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
        ],
      ),
    );
  }
}
