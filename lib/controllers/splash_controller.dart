import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/controllers/onboarding_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

class SplashController extends GetxController {
  RxBool isFirstRun = RxBool(false);

  final AuthStateController _authStateController =
      Get.put(AuthStateController(), permanent: true);
  final OnboardingController _onboardingController =
      Get.put(OnboardingController());

  @override
  void onInit() async {
    super.onInit();
    initialSetup();
  }

  Future<void> initialSetup() async {
    isFirstRun.value = await IsFirstRun.isFirstRun();

    debugPrint("Is First Run: ${isFirstRun.value}");
    debugPrint("SplashController init complete");
  }

  void redirect() {
    if (isFirstRun.value == true ||
        _onboardingController.onboardingCompleted.value == false) {
      debugPrint("Redirecting to Onboarding");
      Get.offAllNamed(AppRoutes.onboarding);
    } else if (_authStateController.isLoggedIn.value == false) {
      debugPrint("Redirecting to Login");
      Get.offAllNamed(AppRoutes.login);
    } else {
      debugPrint("Redirecting to Home");
      Get.offAllNamed(AppRoutes.home);
    }
  }
}
