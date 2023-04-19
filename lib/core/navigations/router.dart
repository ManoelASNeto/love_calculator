import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:love_calculator/features/calculator/presentation/pages/combination_page.dart';
import 'package:love_calculator/features/calculator/presentation/pages/splash_page.dart';

import '../../features/calculator/presentation/bloc/calculator_bloc.dart';
import '../../features/calculator/presentation/pages/home_page.dart';
import '../../injection_container.dart';
import 'routes.dart';

class AppRoutes {
  final _calculatorBloc = sl<CalculatorBloc>();

  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.combinationPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _calculatorBloc,
            child: CombinationPage(
              names: settings.arguments as List<String>,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
    }
  }
}
