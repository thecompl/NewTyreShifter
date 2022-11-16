import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'Common/GetStartedScreen.dart';

import 'config/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      splashIconSize: 200,
      splash: Image.asset(logo, height: size.height * 0.2),
      nextScreen: Get_StartedScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.white,
    );
  }
}
