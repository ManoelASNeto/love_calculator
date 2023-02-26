import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String text;
  const TextFieldCustom({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
