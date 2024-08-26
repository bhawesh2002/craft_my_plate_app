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
      height: UiSizes().h22,
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
              top: constraints.maxHeight * 0.08,
              left: constraints.maxWidth * 0.08,
              right: constraints.maxWidth * 0.05,
              child: Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.08,
                                  color: const Color(0xff242628)),
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: color,
                                  size: constraints.maxHeight * 0.07,
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.01,
                                ),
                                Text(
                                  "Min $guestNumber Guests",
                                  style: TextStyle(
                                      color: color,
                                      fontSize: constraints.maxHeight * 0.06,
                                      letterSpacing: -0.4),
                                )
                              ],
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          padding: EdgeInsets.all(constraints.maxHeight * 0.05),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: constraints.maxHeight * 0.08,
                            color: Colors.white,
                          ),
                        ),
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
