import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UiSizes uiSizes = UiSizes();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current location',
          style: TextStyle(
              fontSize: uiSizes.responsiveFontSize(12),
              fontWeight: FontWeight.w300,
              color: AppColors.lightTextColor),
        ),
        SizedBox(height: uiSizes.w2),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.mapPin,
              width: uiSizes.w4,
            ),
            SizedBox(width: uiSizes.w2),
            Text(
              "Hyderabad",
              style: TextStyle(
                fontSize: uiSizes.responsiveFontSize(14),
              ),
            ),
            SizedBox(width: uiSizes.w2),
            Transform.rotate(
              angle: 3.14 / 2, // 90 degrees
              child: Icon(
                Icons.arrow_forward_ios,
                size: uiSizes.w4,
                color: const Color(0xffAAAAAA),
              ),
            ),
          ],
        )
      ],
    );
  }
}
