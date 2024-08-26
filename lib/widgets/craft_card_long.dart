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
              //Background circle with blur effect
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
                        child: SizedBox.square(
                          dimension: constraints.maxWidth * 0.4, // Example size
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //Content
              Positioned.fill(
                top: constraints.maxHeight * 0.15,
                left: constraints.maxWidth * 0.04,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        "Delivery Box",
                        style: TextStyle(
                            fontSize: constraints.maxWidth *
                                0.05, // Example font size
                            color: const Color(0xff242628)),
                      ),
                      SizedBox(
                          height:
                              constraints.maxHeight * 0.02), // Example spacing
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            color: const Color(0xff935A10),
                            size: constraints.maxWidth *
                                0.04, // Example icon size
                          ),
                          SizedBox(
                            width:
                                constraints.maxWidth * 0.005, // Example spacing
                          ),
                          Text(
                            "Min 10 - Max 120",
                            style: TextStyle(
                              color: const Color(0xff935A10),
                              fontSize: constraints.maxWidth *
                                  0.03, // Example font size
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // See All button
              Positioned(
                bottom: constraints.maxHeight * 0.08,
                left: constraints.maxWidth * 0.05,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.04,
                        vertical: constraints.maxHeight * 0.015,
                      ),
                      backgroundColor: const Color(0xffDD8E18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            constraints.maxWidth *
                                0.09), // Example border radius
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: constraints.maxWidth *
                                0.035, // Example font size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            width: constraints.maxWidth *
                                0.015), // Example spacing
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size:
                              constraints.maxWidth * 0.04, // Example icon size
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
