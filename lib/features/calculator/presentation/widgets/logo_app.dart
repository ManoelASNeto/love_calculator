import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text.rich(
        const TextSpan(
          children: [
            TextSpan(
              text: 'Calculadora do ',
            ),
            TextSpan(text: 'AMOR'),
          ],
        ),
        style: GoogleFonts.caveat(
          textStyle: const TextStyle(
            fontSize: 40,
            color: Colors.red,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
