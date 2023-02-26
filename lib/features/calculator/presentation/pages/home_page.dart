import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../core/ultis/helpers/size_extensions.dart';
import '../bloc/calculator_bloc.dart';

import '../../../../injection_container.dart';
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
    firstController.clear();
    secondController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: context.screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/free-vector/little-red-heart-background_53876-98914.jpg?w=360&t=st=1677427188~exp=1677427788~hmac=92a2d505c12dc633bc8f6f82890ecbe0763cd8a5cd4150b1dee4545e254eb234',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Calculadora\n do\n ',
                        ),
                        TextSpan(text: 'AMOR'),
                      ],
                    ),
                    style: GoogleFonts.caveat(
                        textStyle: const TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                    )),
                    textAlign: TextAlign.center,
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
        return _readyCombination(state);
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
          height: 50,
        ),
        const TextFieldCustom(
          text: 'Primeiro Nome',
        ),
        const SizedBox(
          height: 50,
        ),
        const TextFieldCustom(
          text: 'Segundo Nome',
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
      ],
    );
  }

  Widget _readyCombination(CalculatorState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 50,
        ),
        const TextFieldCustom(
          text: 'Primeiro Nome',
        ),
        const SizedBox(
          height: 50,
        ),
        const TextFieldCustom(
          text: 'Segundo Nome',
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
        SizedBox(
          height: 75,
          width: 75,
          child: Column(
            children: [
              Text(state.combinationEntity!.fname ?? ''),
              Text(state.combinationEntity!.sname ?? ''),
              Text(state.combinationEntity!.percentage ?? ''),
              Text(state.combinationEntity!.result ?? ''),
            ],
          ),
        )
      ],
    );
  }
}
