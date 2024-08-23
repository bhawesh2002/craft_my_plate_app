import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ItemLabel extends StatelessWidget {
  final int count;
  const ItemLabel({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: const BoxDecoration(
        gradient: AppColors.labelGradientReverse,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      ),
      child: Text(
        "$count Items",
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
