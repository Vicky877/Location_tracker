import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import '../bottomNaigate.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      duration: 1000,
      splash: Image.asset('assets/images/maplogo.png'),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.sizeTransition,
    ));
  }
}
