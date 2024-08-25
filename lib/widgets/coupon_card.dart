import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      // width: constraints.maxWidth * 0.6,
                      child: Text(
                        "Enjoy your first\norder, the taste of\nour delicious food!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    DottedBorder(
                      strokeWidth: 2,
                      color: const Color(0xff7B7B7B),
                      dashPattern: const [8, 4],
                      child: Container(
                        // width: constraints.maxWidth * 0.4,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const Text(
                          "FIRSTPLATE01",
                          style: TextStyle(
                            color: AppColors.promoCodeColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: constraints.maxHeight * 0.15,
                      right: constraints.maxWidth * 0.05,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Transform.scale(
                          scale: 1.2,
                          child: SvgPicture.asset(
                            AppImages.cookingSVG,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
