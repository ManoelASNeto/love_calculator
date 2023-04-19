import 'package:flutter/material.dart';
import 'package:love_calculator/core/navigations/routes.dart';
import 'package:love_calculator/core/ultis/helpers/size_extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(Routes.homePage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: context.screenHeight,
        width: context.screenWidth,
        child: Center(
          child: Image.asset('assets/icon/logo_app.png'),
        ),
      ),
    );
  }
}
