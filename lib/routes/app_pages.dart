import 'package:craft_my_plate_app/pages/home_page.dart';
import 'package:craft_my_plate_app/pages/splash_screen.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
  ];
}
