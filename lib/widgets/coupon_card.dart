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
      // width: UiSizes().w80,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        // shape: BoxS,
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
          return Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Expanded(child: SizedBox()),
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
              Positioned.fill(
                top: 20,
                // right: 10,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Transform.scale(
                    scale: 1.2,
                    child: SvgPicture.asset(AppImages.cookingSVG),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
