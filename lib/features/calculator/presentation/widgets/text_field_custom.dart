import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  final IconData? icon;
  final TextEditingController? controller;
  final Color color;
  const TextFieldCustom({
    Key? key,
    required this.text,
    required this.controller,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        style: TextStyle(
          color: Colors.grey.shade200,
        ),
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.white),
          suffixIcon: Icon(icon),
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
