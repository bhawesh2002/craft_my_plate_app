import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuCardLarge extends StatelessWidget {
  const MenuCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: SizedBox(
        width: UiSizes().w82,
        height: UiSizes().h40,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Image
                Expanded(
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: ClipRect(
                      child: Stack(
                        children: [
                          //Background image
                          Positioned(
                            child: Transform.rotate(
                              angle: 3.14 / 2,
                              child: Transform.scale(
                                scale: 2.6,
                                child: Image.asset(
                                  width: constraints.maxWidth,
                                  fit: BoxFit.fitWidth,
                                  height: constraints.maxWidth,
                                  AppImages.specialMenu,
                                ),
                              ),
                            ),
                          ),
                          //Popular tag
                          Positioned(
                            top: constraints.maxHeight * 0.04,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.02,
                                  vertical: constraints.maxHeight * 0.01),
                              decoration: const BoxDecoration(
                                gradient: AppColors.multiPurpleGradienr,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                ),
                              ),
                              child: const Text(
                                "Popular",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //Content
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: constraints.maxWidth * 0.04,
                    horizontal: constraints.maxHeight * 0.03,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.vegIndicator),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Text(
                            "Panjabi Special Menu",
                            textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.045),
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.035,
                      ),
                      DottedBorder(
                        padding: EdgeInsets.zero,
                        color: Colors.grey,
                        dashPattern: const [3, 8],
                        child: SizedBox(
                          height: 0,
                          width: constraints.maxWidth,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "6 Categories & 9 Items",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: constraints.maxWidth * 0.038),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: const Color(0xff60666C),
                                fontSize: constraints.maxWidth * 0.038),
                          )
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.035,
                      ),
                      DottedBorder(
                        padding: EdgeInsets.zero,
                        color: Colors.grey,
                        dashPattern: const [3, 8],
                        child: SizedBox(
                          height: 0,
                          width: constraints.maxWidth,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Starts at ",
                                    style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontSize: constraints.maxWidth * 0.03),
                                  ),
                                  Text(
                                    "₹299",
                                    style: TextStyle(
                                        color: const Color(0xff242628),
                                        fontSize: constraints.maxWidth * 0.038),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: const Color(0xFF505050),
                                    size: constraints.maxWidth * 0.050,
                                  ),
                                  Text(
                                    " 10-600",
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                      applyHeightToFirstAscent: false,
                                      applyHeightToLastDescent: false,
                                    ),
                                    style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontSize: constraints.maxWidth * 0.03),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.sparkles,
                                width: constraints.maxWidth * 0.05,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.01,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "₹219",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " / Person",
                                    style: TextStyle(
                                        color: const Color(0xFF444444),
                                        fontSize: constraints.maxWidth * 0.032,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.02,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: const Color(0xff198754),
                                    size: constraints.maxWidth * 0.05,
                                  ),
                                  Text(
                                    "20%",
                                    style: TextStyle(
                                        color: const Color(0xff198754),
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "  with Dynamic Price for ",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: constraints.maxWidth * 0.030),
                              ),
                              Text(
                                "100 Guests",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: constraints.maxWidth * 0.030),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
