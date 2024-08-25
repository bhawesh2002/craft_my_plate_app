import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HowItWorks extends StatelessWidget {
  const HowItWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.playCircle,
        ),
        const SizedBox(height: 4),
        const Text(
          "How it works?",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
