import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/navigations/routes.dart';
import '../../../../core/ultis/helpers/size_extensions.dart';
import '../widgets/logo_app.dart';
import '../widgets/text_field_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstController.clear();
    secondController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: context.screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon/logo_app.png',
                ),
                opacity: 0.3,
                alignment: Alignment.center,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const LogoApp(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Coloque o seu nome e de uma segunda pessoa para saber qual a porcentagem entre vocês!',
                    style: GoogleFonts.dancingScript(
                      textStyle:
                          const TextStyle(fontSize: 28, color: Colors.red),
                    ),
                  ),
                ),
                _loadingCombination(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingCombination() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 120,
        ),
        TextFieldCustom(
          text: 'Primeiro Nome',
          controller: firstController,
          color: Colors.transparent,
        ),
        const SizedBox(
          height: 50,
        ),
        TextFieldCustom(
          text: 'Segundo Nome',
          controller: secondController,
          color: Colors.transparent,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.red,
                shadowColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
                  Routes.combinationPage,
                  arguments: [firstController.text, secondController.text],
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(MdiIcons.calculatorVariantOutline),
                  Text('Calcular combinação'),
                  Icon(MdiIcons.calculatorVariantOutline),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
