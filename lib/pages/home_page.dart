import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/coupon_card.dart';
import 'package:craft_my_plate_app/widgets/craft_card_long.dart';
import 'package:craft_my_plate_app/widgets/craft_card_short.dart';
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
          gradient: AppColors.pinkGradient),
      MealBoxCard(
          imgPath: AppImages.mealBox,
          count: 4,
          gradient: AppColors.purpleGradient),
      MealBoxCard(
          imgPath: AppImages.mealBoxLarge,
          count: 8,
          gradient: AppColors.yellowGradient),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Hi, ${_auth.currentUser!.displayName}!',
                style: const TextStyle(fontSize: 22, color: AppColors.primary),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current location',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: AppColors.lightTextColor),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "Hyderabad",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 4),
                          Transform.rotate(
                            angle: 3.14 / 2, // 90 degrees
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color(0xffAAAAAA),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(
                        Icons.play_circle_rounded,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 4),
                      Text(
                        "How it works?",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: UiSizes().h20,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const CouponCard();
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Start Crafting",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const CraftCardLong(),
                  const SizedBox(height: 12),
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
                      )),
                      const SizedBox(width: 12),
                      Expanded(
                          child: CraftCardShort(
                        title: "Catering",
                        guestNumber: 120,
                        color: const Color(0xffE70472),
                        imgPath: AppImages.biryani,
                        cardBgColor: const Color(0xffFBDAEA),
                      )),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              Text(
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
              const SizedBox(height: 24),
              const SectionTile(
                title: "Delivery Box",
                quantity: "Min 10 - Max 50",
                description: "Best for small gatherings and house-parties",
                trailingText: "MORE",
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [MenuCardLarge(), MenuCardLarge(), MenuCardLarge()],
                ),
              ),
              const SizedBox(height: 24),
              const SectionTile(
                title: "Meal Box",
                quantity: "Min 10",
                description: "Individually packed meal boxes of happiness!",
                trailingText: "MORE",
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: UiSizes().h16,
                width: UiSizes().w90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mealBoxCards.length,
                  itemBuilder: (context, index) {
                    return mealBoxCards[index];
                  },
                ),
              ),
              const SizedBox(height: 24),
              const SectionTile(
                title: "Catering Menus",
                quantity: "Min 200",
                description:
                    "Best for weddings, Corporate Events, Birthdays etc",
                trailingText: "",
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [MenuCardLarge(), MenuCardLarge(), MenuCardLarge()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
