import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

RichText termNCond() {
  return RichText(
    textAlign: TextAlign.center,
    text: const TextSpan(
      text: "By continuing, I accept",
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: AppColors.lightTextColor,
          height: 1.5),
      children: [
        TextSpan(
          text: " Terms of Conditions",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        TextSpan(
          text: " and",
        ),
        TextSpan(
          text: " Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}
