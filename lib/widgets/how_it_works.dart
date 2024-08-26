import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    final UiSizes uiSizes = UiSizes();
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.playCircle,
        ),
        SizedBox(height: uiSizes.w2),
        Text(
          "How it works?",
          style: TextStyle(
              fontSize: uiSizes.responsiveFontSize(10),
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
