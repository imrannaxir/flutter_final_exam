import 'package:flutter/material.dart';

class temTextFormField extends StatelessWidget {
  final Color? backgroundColor;
  final TextEditingController controller;
  final String? customHintText;
  temTextFormField(
      {required this.controller, this.customHintText, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          fillColor: backgroundColor ?? Colors.green,
          hintText: customHintText),
    );
  }
}
