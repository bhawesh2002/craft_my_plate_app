import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final String quantity;
  final String description;
  final String trailingText;
  const SectionTile(
      {super.key,
      required this.title,
      required this.quantity,
      required this.description,
      required this.trailingText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "(",
                      style: TextStyle(
                          color: AppColors.lightTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const Icon(
                      Icons.person,
                      color: AppColors.lightTextColor,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      quantity,
                      style: const TextStyle(
                          color: AppColors.lightTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      ")",
                      style: TextStyle(
                          color: AppColors.lightTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              description,
              style: const TextStyle(
                  color: AppColors.lightTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        Text(
          trailingText,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
