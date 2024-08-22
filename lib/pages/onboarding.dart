import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  double currentIndex = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingCard> onboardingCards = [
      OnboardingCard(
        svgImgPath: AppImages.onboarding1,
        heading: "Choose & Customize!",
        subHeading:
            "Select a platter, choose and customize menu items and craft a personalized menu for event",
      ),
      OnboardingCard(
        svgImgPath: AppImages.onboarding2,
        heading: "Order More, Save More!",
        subHeading:
            "Experience culinary artistry like never before with our innovative and exquisite cuisine creations",
      ),
      OnboardingCard(
        svgImgPath: AppImages.onboarding3,
        heading: "Personal Order Executive",
        subHeading:
            "Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.",
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 24, right: 24),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: UiSizes().h4),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (currentIndex != 0)
                      TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.buttonSecondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 14, color: AppColors.primary)),
                        child: const Text('Previous'),
                      ),
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(AppRoutes.login);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.buttonSecondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 14, color: AppColors.primary)),
                      child: const Text('Skip'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: UiSizes().h4),
              SizedBox(
                height: UiSizes().h60,
                width: UiSizes().w90,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: onboardingCards.length,
                        itemBuilder: (context, index) {
                          return onboardingCards[index];
                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(onboardingCards.length, (index) {
                  return Container(
                    constraints: const BoxConstraints(maxWidth: 28),
                    width: 28,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.buttonPrimaryColor
                          : AppColors.buttonSecondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              SizedBox(height: UiSizes().h5),
              GestureDetector(
                onTap: () {
                  if (currentIndex == onboardingCards.length - 1) {
                    Get.offNamed(AppRoutes.login);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.buttonSecondaryColor,
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // This controls the slide-in and opacity animation of the "Get Started" text
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (clild, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(0.5, 0),
                                    end: Offset.zero)
                                .animate(animation),
                            child: clild,
                          );
                        },
                        child: (currentIndex == onboardingCards.length - 1)
                            ? AnimatedOpacity(
                                opacity:
                                    currentIndex == onboardingCards.length - 1
                                        ? 1
                                        : 0,
                                duration: const Duration(milliseconds: 300),
                                child: AnimatedSlide(
                                  offset:
                                      currentIndex == onboardingCards.length - 1
                                          ? Offset.zero
                                          : const Offset(0.5, 0),
                                  duration: const Duration(milliseconds: 300),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ),

                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.buttonPrimaryColor,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
