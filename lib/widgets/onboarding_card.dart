import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingCard extends StatefulWidget {
  final String svgImgPath;
  final String heading;
  final String subHeading;
  const OnboardingCard(
      {super.key,
      required this.svgImgPath,
      required this.heading,
      required this.subHeading});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(fit: BoxFit.fill, widget.svgImgPath),
        const SizedBox(height: 20),
        Text(
          widget.heading,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          widget.subHeading,
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
