import 'package:flutter/material.dart';

class myTextInputField extends StatelessWidget {
  final controllar;
  final String labelText;
  final bool obscureText;

  const myTextInputField({
    super.key,
    required this.controllar,
    required this.labelText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllar,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '${labelText}',
      ),
    );
  }
}
