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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _router.generateRoutes,
      initialRoute: Routes.splashPage,
      navigatorObservers: [HeroController()],
    );
  }
}
