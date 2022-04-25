import 'package:citytimes/Screens/Myfeed.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Pagecontroller.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
   return AnimatedSplashScreen(
      splash: 'lib/assets/images/Appicon.jpeg',
      nextScreen: Pagecontroller(),
      splashTransition: SplashTransition.fadeTransition,
    );;
  }
}
