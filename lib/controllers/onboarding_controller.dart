import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  RxBool onboardingCompleted = false.obs;
  late SharedPreferences _prefs;

  @override
  void onInit() {
    super.onInit();
    initialSetup();
  }

  Future<void> initialSetup() async {
    _prefs = await SharedPreferences.getInstance();
    onboardingCompleted.value = _prefs.getBool('onboardingCompleted') ?? false;
    debugPrint('Onboarding Completed: ${onboardingCompleted.value}');
    debugPrint('OnboardingController init complete');
  }

  Future<void> completeOnboarding() async {
    onboardingCompleted.value = true;
    await _prefs.setBool('onboardingCompleted', true);
    debugPrint('Onboarding Completed: ${onboardingCompleted.value}');
  }
}
