import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/item_label.dart';
import 'package:flutter/material.dart';

class MealBoxCard extends StatelessWidget {
  final String imgPath;
  final int count;
  final LinearGradient gradient;
  const MealBoxCard(
      {super.key,
      required this.imgPath,
      required this.count,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UiSizes().w50,
      height: UiSizes().h15,
      margin: const EdgeInsets.all(6),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: gradient,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 50,
            child: Align(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: Transform.scale(
                  scale: 1.1,
                  child: Image.asset(
                    imgPath,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Align(
                alignment: Alignment.centerLeft,
                child: ItemLabel(count: count)),
          ),
        ],
      ),
    );
  }
}
