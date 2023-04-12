import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_calculator/features/calculator/presentation/pages/combination_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../core/ultis/helpers/size_extensions.dart';
import '../../../../injection_container.dart';
import '../bloc/calculator_bloc.dart';
import '../widgets/text_field_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  final _calculatorBloc = sl<CalculatorBloc>();

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
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
                Padding(
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
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Coloque o seu nome e de uma segunda pessoa para saber qual a porcentagem entre vocês!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    return _state(state);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _state(
    CalculatorState state,
  ) {
    switch (state.status) {
      case CalculatorStatus.loading:
        return _loadingCombination(state);
      case CalculatorStatus.ready:
        return const CombinationPage();
      default:
        return const Center(
          child: Text('Carregando'),
        );
    }
  }

  Widget _loadingCombination(CalculatorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 150,
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
                _calculatorBloc.add(
                  CalculatorLoveEvent(
                    firstController.text,
                    secondController.text,
                  ),
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

  Widget _readyCombination(CalculatorState state) {
    final loveResult = state.combinationEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 50,
        ),
        TextFieldCustom(
          text: 'Primeiro Nome',
          controller: firstController,
          color: Colors.blue.shade200,
        ),
        const SizedBox(
          height: 50,
        ),
        TextFieldCustom(
          text: 'Segundo Nome',
          controller: secondController,
          color: Colors.pink.shade200,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                _calculatorBloc.add(
                  CalculatorLoveEvent(
                    firstController.text,
                    secondController.text,
                  ),
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
        const SizedBox(
          height: 35,
        ),
        Column(
          children: [
            const Text(
              'O Resultado da Combinação é:',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Text(
              '${loveResult!.fname} e ${loveResult.sname}',
              style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            Text(
              '${loveResult.percentage}%',
              style: const TextStyle(fontSize: 40, color: Colors.red),
            ),
            Text(
              _resultCombination(loveResult.result),
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        )
      ],
    );
  }

  String _resultCombination(String? result) {
    switch (result) {
      case 'Congratulations! Good choice':
        return 'Parabéns! Boa combinação';
      case 'Can choose someone better.':
        return 'Pode escolher alguém melhor';
      case 'All the best!':
        return 'Uma boa escolha!';
      case 'May be better next time.':
        return 'Mais sorte na proxima!';
      default:
        return 'Sem dados para combinar';
    }
  }
}
