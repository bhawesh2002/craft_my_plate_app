import 'package:craft_my_plate_app/utils/app_colors.dart';
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
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Transform.scale(
                scale: 1.2, child: Center(child: Lottie.asset(lottiePath))),
          ),
          Text(
            heading,
            style: TextStyle(fontSize: constraints.maxWidth * 0.06),
          ),
          SizedBox(height: constraints.maxHeight * 0.03),
          Text(
            subHeading,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: constraints.maxWidth * 0.045,
              color: AppColors.lightTextColor,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      );
    });
  }
}
