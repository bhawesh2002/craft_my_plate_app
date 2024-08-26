import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/app_svgs.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/cmp_bottom_app_bar.dart';
import 'package:craft_my_plate_app/widgets/coupon_card.dart';
import 'package:craft_my_plate_app/widgets/craft_card_long.dart';
import 'package:craft_my_plate_app/widgets/craft_card_short.dart';
import 'package:craft_my_plate_app/widgets/how_it_works.dart';
import 'package:craft_my_plate_app/widgets/location_widget.dart';
import 'package:craft_my_plate_app/widgets/meal_box_card.dart';
import 'package:craft_my_plate_app/widgets/menu_card_large.dart';
import 'package:craft_my_plate_app/widgets/section_tile.dart';
import 'package:craft_my_plate_app/widgets/see_all_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final UiSizes uiSizes = UiSizes();
    List<MealBoxCard> mealBoxCards = [
      MealBoxCard(
        imgPath: AppImages.mealBoxSmall,
        count: 3,
        gradient: AppColors.pinkGradient,
        topPos: -0.12,
        leftPos: 0.2,
        scale: 1.2,
      ),
      MealBoxCard(
        imgPath: AppImages.mealBox,
        count: 5,
        gradient: AppColors.purpleGradient,
        topPos: -0.15,
        leftPos: 0.16,
        scale: 1.2,
      ),
      MealBoxCard(
        imgPath: AppImages.mealBoxLarge,
        count: 8,
        gradient: AppColors.yellowGradient,
        topPos: -0.15,
        leftPos: 0.16,
        scale: 1.2,
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: uiSizes.h1),
                  // Welcome message
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: Text(
                      'Hi, ${_auth.currentUser!.displayName}!',
                      style: TextStyle(
                        fontSize: uiSizes.responsiveFontSize(22),
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: uiSizes.h2),
                  // Add the LocationWidget and HowItWorks widgets here
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w5),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LocationWidget(), HowItWorks()],
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  // Coupon cards
                  SizedBox(
                    height: uiSizes.h16,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                          child: const CouponCard(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: Text(
                      "Start Crafting",
                      style: TextStyle(
                        fontSize: uiSizes.responsiveFontSize(20),
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: uiSizes.h2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: Column(
                      children: [
                        const CraftCardLong(),
                        SizedBox(height: uiSizes.h2),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CraftCardShort(
                                title: "Meal Box",
                                guestNumber: 10,
                                color: const Color(0xff6318AF),
                                imgPath: AppImages.mealBox,
                                cardBgColor: const Color(0xffFBF7FE),
                                angle: -0.2,
                                leftPos: 0.05,
                                topPos: 0.40,
                              ),
                            ),
                            SizedBox(width: uiSizes.w3),
                            Expanded(
                              child: CraftCardShort(
                                title: "Catering",
                                guestNumber: 120,
                                color: const Color(0xffE70472),
                                imgPath: AppImages.biryani,
                                cardBgColor: const Color(0xffFBDAEA),
                                topPos: 0.25,
                                leftPos: 0.05,
                                scale: 1.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: Text(
                      "Choose Your Platter",
                      style: TextStyle(
                        fontSize: uiSizes.responsiveFontSize(18),
                        height: 1.5,
                        color: const Color(0xff242628),
                        fontWeight: FontWeight.w500,
                        shadows: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: const SectionTile(
                      title: "Delivery Box",
                      quantity: "Min 10 - Max 50",
                      description:
                          "Best for small gatherings and house-parties",
                      trailingText: "MORE",
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      // height: uiSizes.h40,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: uiSizes.h1,
                              horizontal: uiSizes.w4,
                            ),
                            child: const SeeAllCard(
                              primaryColor: Color(0xffE70472),
                              secondaryColor: Color(0xffFEF1F7),
                              blurColor: Color(0xffFCC1DD),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: const SectionTile(
                      title: "Meal Box",
                      quantity: "Min 10",
                      description:
                          "Individually packed meal boxes of happiness!",
                      trailingText: "MORE",
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  SizedBox(
                    height: uiSizes.h16,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mealBoxCards.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: mealBoxCards[index],
                          );
                        }
                        if (index == mealBoxCards.length - 1) {
                          return Padding(
                            padding: EdgeInsets.only(right: uiSizes.w4),
                            child: mealBoxCards[index],
                          );
                        }
                        return mealBoxCards[index];
                      },
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
                    child: const SectionTile(
                      title: "Catering Menus",
                      quantity: "Min 200",
                      description:
                          "Best for weddings, Corporate Events, Birthdays etc",
                      trailingText: "",
                    ),
                  ),
                  SizedBox(height: uiSizes.h3),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: uiSizes.w4),
                            child: const MenuCardLarge(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: uiSizes.h1,
                              horizontal: uiSizes.w4,
                            ),
                            child: const SeeAllCard(
                              primaryColor: Color(0xffDD8E18),
                              secondaryColor: Color(0xffFDFAEC),
                              blurColor: Color(0xffF6D798),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: uiSizes.h10),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppSvgs.arrowHeadSVG),
                        SizedBox(width: uiSizes.w2),
                        Text(
                          "You Customize, We Cater!",
                          style: TextStyle(
                            color: AppColors.lightTextColor,
                            fontSize: uiSizes.responsiveFontSize(12),
                          ),
                        ),
                        SizedBox(width: uiSizes.w2),

                        // Rotated arrow head by 180 degrees
                        Transform.rotate(
                            angle: 3.14 / 1,
                            child: SvgPicture.asset(AppSvgs.arrowHeadSVG))
                      ],
                    ),
                  ),
                  SizedBox(height: uiSizes.h15),
                ],
              ),
            ),
            // Bottom navigation bar
            Positioned.fill(
              bottom: uiSizes.h2,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: CmpBottomAppBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
