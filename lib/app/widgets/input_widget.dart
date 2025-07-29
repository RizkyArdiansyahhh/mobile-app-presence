import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final controller;
  final String label;
  final Icon icon;
  final TextInputType textInputType;
  final bool obscureText;
  final Widget? suffixIcon;

  const InputWidget({
    super.key,
    this.controller,
    this.suffixIcon,
    required this.obscureText,
    required this.label,
    required this.icon,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      autocorrect: false,
      controller: (controller != null) ? controller : null,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: const Color(0xff386641)),
        prefixIcon: icon,
        prefixIconColor: const Color(0xff386641),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff386641)),
        ),
      ),
    );
  }
}
