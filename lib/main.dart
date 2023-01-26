import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'core/navigations/router.dart';
import 'core/navigations/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding();
  await di.init();

  EquatableConfig.stringify = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _router = AppRoutes();

    return MaterialApp(
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.homePage,
      navigatorObservers: [HeroController()],
    );
  }
}
