import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;

  final TextEditingController? controller;
  final Color color;

  const TextFieldCustom({
    super.key,
    required this.text,
    required this.controller,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: color,
          filled: true,
          isDense: true,
        ),
      ),
    );
  }
}
