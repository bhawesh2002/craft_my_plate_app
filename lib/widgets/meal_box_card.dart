import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/item_label.dart';
import 'package:flutter/material.dart';

class MealBoxCard extends StatelessWidget {
  final String imgPath;
  final int count;
  final LinearGradient gradient;

  /// The top position of the image in the card Defaults to 0.1
  final double? topPos;

  /// The left position of the image in the card Defaults to 0.1
  final double? leftPos;

  /// The angle of the image in the card Defaults to 0
  final double? angle;

  /// The scale of the image in the card Defaults to 1.1
  final double? scale;
  const MealBoxCard(
      {super.key,
      required this.imgPath,
      required this.count,
      required this.gradient,
      this.topPos,
      this.leftPos,
      this.angle,
      this.scale});

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
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: constraints.maxHeight * (topPos ?? 0.1),
                left: constraints.maxWidth * (leftPos ?? 0.1),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.rotate(
                    angle: angle ?? 0,
                    child: Transform.scale(
                      scale: scale ?? 1.1,
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
                    child: ItemLabel(count: count, label: 'Items Box')),
              ),
            ],
          );
        }));
  }
}
