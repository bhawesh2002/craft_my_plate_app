import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({super.key});

  @override
  Widget build(BuildContext context) {
    final uiSizes = UiSizes();
    uiSizes.init(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: uiSizes.w4,
            offset: Offset(0, uiSizes.h1),
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
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * 0.05,
                  horizontal: constraints.maxWidth * 0.04,
                ),
                child: Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "Enjoy your first\norder, the taste of\nour delicious food!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 0.038 * constraints.maxWidth,
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
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.06,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Text(
                              "FIRSTPLATE01",
                              style: TextStyle(
                                color: AppColors.promoCodeColor,
                                fontSize: 0.03 * constraints.maxWidth,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: constraints.maxHeight * 0.15,
                      right: constraints.maxWidth * 0.04,
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
