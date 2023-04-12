import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_calculator/features/calculator/presentation/bloc/calculator_bloc.dart';
import 'package:love_calculator/features/calculator/presentation/pages/home_page.dart';

import '../widgets/percent_gauge.dart';

class CombinationPage extends StatefulWidget {
  const CombinationPage({
    super.key,
  });

  @override
  State<CombinationPage> createState() => _CombinationPageState();
}

class _CombinationPageState extends State<CombinationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        final loveResult = state.combinationEntity;

        return Column(
          children: [
            PercentGauge(
              percent: double.parse(loveResult!.percentage!),
            ),
            Text(
              "${loveResult.percentage!}%",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  loveResult.fname!,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(loveResult.sname!),
              ],
            ),
            Text(
              _resultCombination(loveResult.result),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .pop(MaterialPageRoute(builder: (_) => const HomePage()));
            //     },
            //     child: Text('Refazer o teste'))
          ],
        );
      },
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


// BlocBuilder<CalculatorBloc, CalculatorState>(
//           builder: (context, state) {
//             final loveResult = state.combinationEntity;
//             return PercentGauge(
//               percent: double.parse(loveResult!.percentage!),
//             );
//           },
//         ),
