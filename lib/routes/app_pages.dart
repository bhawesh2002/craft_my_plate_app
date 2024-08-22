import 'package:craft_my_plate_app/pages/home_page.dart';
import 'package:craft_my_plate_app/pages/info_collection_page.dart';
import 'package:craft_my_plate_app/pages/login_page.dart';
import 'package:craft_my_plate_app/pages/onboarding.dart';
import 'package:craft_my_plate_app/pages/otp_verification.dart';
import 'package:craft_my_plate_app/pages/splash_screen.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    GetPage(name: AppRoutes.onboarding, page: () => const Onboarding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.verification, page: () => const OtpVerification()),
    GetPage(
        name: AppRoutes.infoCollection, page: () => const InfoCollectionPage())
  ];
}
