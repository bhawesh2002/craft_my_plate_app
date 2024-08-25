import 'dart:ui';

import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';

class CraftCardShort extends StatelessWidget {
  final int guestNumber;
  final String imgPath;
  final String title;
  final Color color;
  final Color cardBgColor;

  /// The top position of the image in the card Defaults to 0.45
  final double? topPos;

  /// The left position of the image in the card Defaults to 0.10
  final double? leftPos;

  /// The angle of the image in the card Defaults to 0
  final double? angle;

  /// The scale of the image in the card Defaults to 1.1
  final double? scale;
  const CraftCardShort(
      {super.key,
      required this.guestNumber,
      required this.imgPath,
      required this.title,
      required this.color,
      required this.cardBgColor,
      this.topPos,
      this.leftPos,
      this.angle,
      this.scale});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UiSizes().h20,
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              top: constraints.maxHeight * 0.6,
              child: Align(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 1.1,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 125, sigmaY: 80),
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 12,
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      padding: const EdgeInsets.all(6),
                      shape: const CircleBorder()),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: constraints.maxHeight * 0.06,
              left: constraints.maxWidth * 0.08,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xff242628)),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          color: color,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Min $guestNumber Guests",
                          style: TextStyle(
                              color: color, fontSize: 12, letterSpacing: -0.4),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: constraints.maxHeight * (topPos ?? 0.45),
              left: -constraints.maxWidth * (leftPos ?? 0.10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: angle ?? 0,
                  child: Transform.scale(
                    scale: scale ?? 1.1,
                    child: Image.asset(
                      fit: BoxFit.contain,
                      imgPath,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
