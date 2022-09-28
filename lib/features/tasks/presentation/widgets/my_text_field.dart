import 'package:flutter/material.dart';

/// Custom Text Field
class MyTextField extends StatelessWidget {
  /// Constructor
  const MyTextField(
      {super.key,
      required this.label,
      this.maxLines = 1,
      this.minLines = 1,
      this.icon});

  /// Text field label
  final String label;

  /// Text field max lines
  final int maxLines;

  /// Text field min lines
  final int minLines;

  /// Text field icon
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black87),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
          suffixIcon: icon,
          labelText: label,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          focusedBorder: const UnderlineInputBorder(),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
