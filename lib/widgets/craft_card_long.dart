import 'dart:ui';

import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';

class CraftCardLong extends StatelessWidget {
  const CraftCardLong({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: UiSizes().h20,
        decoration: BoxDecoration(
          color: const Color(0xffFDFAEC),
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                left: constraints.maxWidth * 0.3,
                top: constraints.maxHeight * 0.3,
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: 1.4,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffDD8E18)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 110, sigmaY: 35),
                        blendMode: BlendMode.srcIn,
                        child: const SizedBox.square(
                          dimension: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: constraints.maxHeight * 0.12,
                left: constraints.maxWidth * 0.05,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        "Delivery Box",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff242628)),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: Color(0xff935A10),
                            size: 14,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Min 10 - Max 120",
                            style: TextStyle(
                              color: Color(0xff935A10),
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                bottom: constraints.maxHeight * 0.10,
                left: constraints.maxWidth * 0.05,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      backgroundColor: const Color(0xffDD8E18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.10,
                left: constraints.maxWidth * 0.44,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.scale(
                    scale: 1.25,
                    child: Image.asset(
                      fit: BoxFit.contain,
                      AppImages.deliveryBox,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
