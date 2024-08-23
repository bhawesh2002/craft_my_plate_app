import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuCardLarge extends StatelessWidget {
  const MenuCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Material(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        child: SizedBox(
          width: UiSizes().w80,
          // height: UiSizes().h45,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipRect(
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: 3.14 / 2,
                        child: Transform.scale(
                          scale: 2.2,
                          child: Image.asset(
                            width: UiSizes().width,
                            fit: BoxFit.fill,
                            AppImages.specialMenu,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: const BoxDecoration(
                              gradient: AppColors.multiPurpleGradienr,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                            child: const Text(
                              "Popular",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'lib/assets/icons/veg_indicator.svg'),
                          const SizedBox(width: 6),
                          const Text(
                            "Panjabi Special Menu",
                            textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DottedBorder(
                        padding: EdgeInsets.zero,
                        color: Colors.grey,
                        dashPattern: const [3, 8],
                        child: SizedBox(
                          height: 0,
                          width: UiSizes().w80,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "6 Categories & 9 Items",
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 14),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: Color(0xff60666C), fontSize: 14),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DottedBorder(
                        padding: EdgeInsets.zero,
                        color: Colors.grey,
                        dashPattern: const [3, 8],
                        child: SizedBox(
                          height: 0,
                          width: UiSizes().w80,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Starts at ",
                                    style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "₹299",
                                    style: TextStyle(
                                        color: Color(0xff242628), fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AppColors.lightTextColor,
                                  ),
                                  Text(
                                    " 10-600",
                                    style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'lib/assets/icons/sparkles.svg',
                                width: 20,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "₹219",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " / Person",
                                    style: TextStyle(
                                        color: AppColors.lightTextColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Color(0xff198754),
                                    size: 16,
                                  ),
                                  Text(
                                    "24%",
                                    style: TextStyle(
                                        color: Color(0xff198754),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "with Dynamic Price for ",
                                style: TextStyle(
                                    color: AppColors.primary, fontSize: 11),
                              ),
                              Text(
                                "100 Guests",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
