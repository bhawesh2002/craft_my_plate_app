import 'package:craft_my_plate_app/controllers/onboarding_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_lottie.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/get_started_button.dart';
import 'package:craft_my_plate_app/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  final OnboardingController _onboardingController =
      Get.put(OnboardingController());

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
    final UiSizes uiSizes = UiSizes();

    final List<OnboardingCard> onboardingCards = [
      OnboardingCard(
        lottiePath: AppLottie.onboarding1Lottie,
        heading: "Choose & Customize!",
        subHeading:
            "Select a platter, choose and customize menu items and craft a personalized menu for event",
      ),
      OnboardingCard(
        lottiePath: AppLottie.onboarding2Lottie,
        heading: "Order More, Save More!",
        subHeading:
            "Experience culinary artistry like never before with our innovative and exquisite cuisine creations",
      ),
      OnboardingCard(
        lottiePath: AppLottie.onboarding3Lottie,
        heading: "Personal Order Executive",
        subHeading:
            "Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.",
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: uiSizes.w4,
            right: uiSizes.w4),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: uiSizes.h4),
              //Skip button
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: () async {
                        await _onboardingController
                            .completeOnboarding()
                            .whenComplete(() {
                          if (_onboardingController.onboardingCompleted.value) {
                            Get.offNamed(AppRoutes.login);
                          }
                        });
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
              SizedBox(height: uiSizes.h1),
              SizedBox(
                height: uiSizes.h60,
                width: uiSizes.w95,
                child: Padding(
                  padding: EdgeInsets.all(uiSizes.w4),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingCards.length,
                        itemBuilder: (context, index) {
                          return onboardingCards[index];
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: const SwapEffect(
                        dotColor: AppColors.buttonSecondaryColor,
                        activeDotColor: AppColors.buttonPrimaryColor,
                        dotHeight: 12,
                        dotWidth: 30,
                        spacing: 16,
                      ),
                    ),
                    SizedBox(height: uiSizes.h4),
                    GestureDetector(
                      onTap: () async {
                        if (currentIndex == onboardingCards.length - 1) {
                          await _onboardingController
                              .completeOnboarding()
                              .whenComplete(() {
                            if (_onboardingController
                                .onboardingCompleted.value) {
                              Get.offNamed(AppRoutes.login);
                            }
                          });
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      },
                      child: GetStartedButton(
                        pageIndex: currentIndex,
                        triggerPageIndex: onboardingCards.length - 1,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
