import 'package:craft_my_plate_app/controllers/splash_controller.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_svgs.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SplashController _splashController = Get.put(SplashController());
  late AnimationController _animationController;

  late final Animation<double> scale;
  late final Animation<double> logoScale;

  late final Animation<double> rotate;
  late final Animation<double> opacity;
  late final Animation<double> topPosition;
  final Curve curve = Curves.easeInOutBack;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    rotate = Tween<double>(begin: 0, end: 30).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInBack));
    scale = Tween<double>(begin: 4, end: 7)
        .animate(CurvedAnimation(parent: _animationController, curve: curve));
    logoScale = Tween<double>(begin: 1, end: 1.5)
        .animate(CurvedAnimation(parent: _animationController, curve: curve));
    opacity = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic));
    topPosition = Tween<double>(begin: UiSizes().h50, end: UiSizes().h30)
        .animate(CurvedAnimation(parent: _animationController, curve: curve));

    _animationController.forward().whenComplete(() {
      // Redirect to the appropriate screen
      _splashController.redirect();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Transform.rotate(
                  angle: rotate.value * (math.pi / 180),
                  child: Transform.scale(
                    scale: scale.value,
                    child: SvgPicture.asset(fit: BoxFit.none, AppSvgs.bgSVG),
                  ),
                ),
              ),
              Positioned.fill(
                // bottom: 70,
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: logoScale.value,
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      AppSvgs.logoSVG,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: UiSizes().h28,
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: opacity.value,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: UiSizes().responsiveFontSize(30),
                        fontFamily: GoogleFonts.capriola().fontFamily,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: topPosition.value,
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 1 - opacity.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Craft My Plate",
                          style: TextStyle(
                            fontSize: UiSizes().responsiveFontSize(30),
                            fontFamily: GoogleFonts.capriola().fontFamily,
                            color: AppColors.secondary,
                          ),
                        ),
                        SizedBox(
                          height: UiSizes().h1,
                        ),
                        Text(
                          "You Customize, We Cater",
                          style: TextStyle(
                            fontSize: UiSizes().responsiveFontSize(18),
                            fontFamily: GoogleFonts.courgette().fontFamily,
                            color: AppColors.courgetteTextColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
