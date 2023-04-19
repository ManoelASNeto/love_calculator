import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_calculator/core/navigations/routes.dart';
import 'package:love_calculator/core/ultis/helpers/size_extensions.dart';
import 'package:love_calculator/features/calculator/presentation/bloc/calculator_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../injection_container.dart';
import '../widgets/logo_app.dart';
import '../widgets/percent_gauge.dart';

class CombinationPage extends StatefulWidget {
  final List<String>? names;
  const CombinationPage({
    super.key,
    required this.names,
  });

  @override
  State<CombinationPage> createState() => _CombinationPageState();
}

class _CombinationPageState extends State<CombinationPage> {
  final _calculatorBloc = sl<CalculatorBloc>();

  @override
  void initState() {
    _calculatorBloc.add(
      CalculatorLoveEvent(
        widget.names![0],
        widget.names![1],
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        final loveResult = state.combinationEntity;
        switch (state.status) {
          case CalculatorStatus.loading:
            return Scaffold(
              body: Center(
                child: Text(
                  'Carregando',
                  style: GoogleFonts.dancingScript(
                    textStyle: const TextStyle(fontSize: 28, color: Colors.red),
                  ),
                ),
              ),
            );
          case CalculatorStatus.ready:
            return Scaffold(
              body: Container(
                height: context.screenHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon/logo_app.png'),
                    opacity: 0.3,
                    alignment: Alignment.center,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LogoApp(),
                      PercentGauge(
                        percent: double.parse(loveResult?.percentage ?? ''),
                      ),
                      Text(
                        "${loveResult?.percentage ?? 0}%",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            loveResult?.fname ?? '',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Text('&'),
                          Text(
                            loveResult?.sname ?? '',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Text(
                        _resultCombination(
                          loveResult?.result,
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.homePage);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Refazer combinação'),
                                Icon(MdiIcons.refresh),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          default:
            return const Center(
              child: Text('Carregando'),
            );
        }
      },
    );
  }

  String _resultCombination(String? result) {
    switch (result) {
      case 'Congratulations! Good choice':
        return 'Parabéns! Vocês formam uma boa combinação.';
      case 'Can choose someone better.':
        return 'Poderia escolher alguém melhor!.';
      case 'All the best!':
        return 'Legal! É uma boa escolha.';
      case 'May be better next time.':
        return 'Mais sorte na proxima!';
      default:
        return 'Sem dados para combinar';
    }
  }
}
