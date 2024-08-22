import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the UiSizes class
    UiSizes().init(context);
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: 'Lexend',
      ),
      home: const Scaffold(body: Center()),
    );
  }
}
