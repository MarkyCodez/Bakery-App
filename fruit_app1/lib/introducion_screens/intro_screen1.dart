import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen1 extends StatelessWidget {
  final String text;
  final String animation;
  const IntroScreen1({super.key, required this.text, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(201, 229, 252, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          // LottieBuilder.asset(
          //   animation,
          //   reverse: true,
          //   repeat: true,
          //   fit: BoxFit.cover,
          // ),
        ],
      ),
    );
  }
}
