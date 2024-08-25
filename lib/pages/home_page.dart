import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/coupon_card.dart';
import 'package:craft_my_plate_app/widgets/craft_card_long.dart';
import 'package:craft_my_plate_app/widgets/craft_card_short.dart';
import 'package:craft_my_plate_app/widgets/how_it_works.dart';
import 'package:craft_my_plate_app/widgets/location_widget.dart';
import 'package:craft_my_plate_app/widgets/meal_box_card.dart';
import 'package:craft_my_plate_app/widgets/menu_card_large.dart';
import 'package:craft_my_plate_app/widgets/section_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    List<MealBoxCard> mealBoxCards = [
      MealBoxCard(
        imgPath: AppImages.mealBoxSmall,
        count: 3,
        gradient: AppColors.pinkGradient,
        topPos: -0.2,
        leftPos: 0.15,
        scale: 1.2,
      ),
      MealBoxCard(
        imgPath: AppImages.mealBox,
        count: 4,
        gradient: AppColors.purpleGradient,
        topPos: -0.12,
        leftPos: 0.2,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Hi, ${_auth.currentUser!.displayName}!',
                  style:
                      const TextStyle(fontSize: 22, color: AppColors.primary),
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LocationWidget(), HowItWorks()],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: UiSizes().h16,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CouponCard(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Start Crafting",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //Craft Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const CraftCardLong(),
                    const SizedBox(height: 16),
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
                        const SizedBox(width: 12),
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
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Choose Your Platter",
                  style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: const Color(0xff242628),
                      fontWeight: FontWeight.w500,
                      shadows: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SectionTile(
                  title: "Delivery Box",
                  quantity: "Min 10 - Max 50",
                  description: "Best for small gatherings and house-parties",
                  trailingText: "MORE",
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: UiSizes().w4),
                      child: const MenuCardLarge(),
                    ),
                    const MenuCardLarge(),
                    Padding(
                        padding: EdgeInsets.only(right: UiSizes().w4),
                        child: const MenuCardLarge()),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SectionTile(
                  title: "Meal Box",
                  quantity: "Min 10",
                  description: "Individually packed meal boxes of happiness!",
                  trailingText: "MORE",
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: UiSizes().h16,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mealBoxCards.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.only(left: UiSizes().w4),
                        child: mealBoxCards[index],
                      );
                    }
                    if (index == mealBoxCards.length - 1) {
                      return Padding(
                        padding: EdgeInsets.only(right: UiSizes().w4),
                        child: mealBoxCards[index],
                      );
                    }
                    return mealBoxCards[index];
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SectionTile(
                  title: "Catering Menus",
                  quantity: "Min 200",
                  description:
                      "Best for weddings, Corporate Events, Birthdays etc",
                  trailingText: "",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: UiSizes().w4),
                      child: const MenuCardLarge(),
                    ),
                    const MenuCardLarge(),
                    Padding(
                        padding: EdgeInsets.only(right: UiSizes().w4),
                        child: const MenuCardLarge()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
