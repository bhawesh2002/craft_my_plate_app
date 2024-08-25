import 'dart:ui';

import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';

class SeeAllCard extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color blurColor;
  final double? width;
  const SeeAllCard(
      {super.key,
      required this.primaryColor,
      required this.blurColor,
      required this.secondaryColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? UiSizes().w45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          Positioned(
            bottom: -UiSizes().h6,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: blurColor,
                      boxShadow: [
                        //Inner Shadow
                        BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                            color: Colors.black.withOpacity(0.25))
                      ]),
                  child: const SizedBox.square(
                    dimension: 180,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.all(6),
                        shape: const CircleBorder()),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "See All",
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
