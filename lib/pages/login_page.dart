import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStateController _authStateController =
      Get.put(AuthStateController());

  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                // height: UiSizes().h70,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      AnimatedScale(
                          scale: MediaQuery.of(context).viewInsets.bottom == 0
                              ? 2
                              : 1,
                          alignment:
                              MediaQuery.of(context).viewInsets.bottom == 0
                                  ? Alignment.bottomCenter
                                  : Alignment.center,
                          duration: const Duration(milliseconds: 100),
                          child: SvgPicture.asset(AppImages.logoSVG)),
                      const SizedBox(height: 24),
                      const Text(
                        "India’s 1st Dynamic Pricing Food Catering App",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log In or Sign Up with Craft My Plate",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.textFieldBorderColor)),
                        child: const Text("+91"),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.textFieldBorderColor)),
                          child: TextField(
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      _phoneFocusNode.unfocus();
                      await _authStateController
                          .sendOtp("+91${_phoneController.text.trim()}");
                      Get.toNamed(AppRoutes.verification,
                          arguments: _phoneController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: UiSizes().w75,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "By continuing, I accept",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: AppColors.lightTextColor,
                              height: 1.5),
                          children: [
                            TextSpan(
                              text: " Terms of Conditions",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: " and",
                            ),
                            TextSpan(
                              text: " Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
