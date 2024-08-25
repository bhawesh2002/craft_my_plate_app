import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingCard extends StatelessWidget {
  final String lottiePath;
  final String heading;
  final String subHeading;
  const OnboardingCard(
      {super.key,
      required this.lottiePath,
      required this.heading,
      required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
            scale: 3,
            child: SizedBox(
                width: 250,
                height: 250,
                child: Center(child: Lottie.asset(lottiePath)))),
        const SizedBox(height: 20),
        Text(
          heading,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          subHeading,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
