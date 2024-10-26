import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ukk_hotel/components/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 300,
      splash: Text(
        "Dwiku",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic),
      ),
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Color.fromARGB(255, 14, 63, 169),
    );
  }
}
