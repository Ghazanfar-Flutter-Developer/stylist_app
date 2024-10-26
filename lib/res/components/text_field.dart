import 'package:flutter/material.dart';

class TextFieldT extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType type;

  const TextFieldT({
    super.key,
    required this.title,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        fillColor: Colors.orange.shade100,
        filled: true,
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
