import 'package:craft_my_plate_app/routes/app_pages.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UiSizes class
    UiSizes().init(context);
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: 'Lexend',
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      home: const Scaffold(body: Center()),
    );
  }
}
