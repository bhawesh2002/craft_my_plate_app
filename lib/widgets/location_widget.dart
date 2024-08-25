import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current location',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.lightTextColor),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.mapPin,
            ),
            const SizedBox(width: 6),
            const Text(
              "Hyderabad",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 6),
            Transform.rotate(
              angle: 3.14 / 2, // 90 degrees
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xffAAAAAA),
              ),
            ),
          ],
        )
      ],
    );
  }
}
