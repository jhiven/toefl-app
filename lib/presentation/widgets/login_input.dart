import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({
    super.key,
    this.keyboardType,
    this.validator,
    required this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    required this.enabled,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff14487A),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff14487A),
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff14487A),
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        isDense: true,
        labelText: labelText,
      ),
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      enabled: enabled,
    );
  }
}
