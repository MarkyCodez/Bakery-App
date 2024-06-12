import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app1/introducion_screens/introduction_screens.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        curve: Curves.easeIn,
        splashIconSize: 700,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        splash: Column(
          children: [
            SizedBox(height: 100,),
            Lottie.asset("assets/animations/Animation - 1715020671181.json"),
            Text(
              "Backery App",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        nextScreen: Intro(),
      ),
    );
  }
}
