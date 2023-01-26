import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/calculator/presentation/bloc/calculator_bloc.dart';
import '../../features/calculator/presentation/pages/home_page.dart';
import '../../injection_container.dart';
import 'routes.dart';

class AppRoutes {
  final _calculatorBloc = sl<CalculatorBloc>();

  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _calculatorBloc,
            child: const HomePage(),
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
