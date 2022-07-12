import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {required this.label, this.maxLines = 1, this.minLines = 1, this.icon});
  final String label;
  final int maxLines;
  final int minLines;
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
