import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/widgets/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  // final TextEditingController _otpController = TextEditingController();
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();
  bool otpVerified = false;

  final String phoneNumber = Get.arguments as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'OTP Verification',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "We have sent a verification code to",
              style: TextStyle(
                  fontSize: 16, color: AppColors.textColorFaded, height: 2.4),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Get.arguments != null
                      ? "+91-${(phoneNumber.replaceRange(0, 6, "XXXXXX"))}"
                      : "+91-XXXXXXXXXX",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, height: 2.4),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.verified_rounded,
                  color: AppColors.verifiedColor,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: AppColors.textFieldBorderColor,
              fieldWidth: 50,
              focusedBorderColor: AppColors.primary,
              disabledBorderColor: AppColors.textFieldBorderColor,
              textStyle: const TextStyle(fontSize: 16),
              onCodeChanged: (value) {
                if (value.length != 6) {
                  setState(() {
                    otpVerified = false;
                  });
                }
              },
              onSubmit: (value) async {
                await _authStateController.verifyOtp(value).then((_) {
                  _authStateController.isVerified.value == true
                      ? {
                          setState(() {
                            otpVerified = true;
                          }),
                          infoSnackBar(
                            title: "Success",
                            message:
                                "OTP Verified Successfully. You may continue.",
                          )
                        }
                      : {
                          value = '',
                          errorSnackBar(
                            title: "Error",
                            message: "Invalid OTP. Please try again.",
                          )
                        };
                });
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: ElevatedButton(
                onPressed: otpVerified == true
                    ? () {
                        if (_authStateController.isNewUser.value) {
                          Get.toNamed(AppRoutes.infoCollection);
                        } else if (FirebaseAuth
                                    .instance.currentUser?.displayName ==
                                null ||
                            FirebaseAuth.instance.currentUser?.email == null) {
                          Get.toNamed(AppRoutes.infoCollection);
                        } else {
                          Get.offAllNamed(AppRoutes.home);
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: otpVerified
                        ? const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const SizedBox.square(
                            dimension: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Didn’t receive code?",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 6),
                Obx(
                  () => GestureDetector(
                    // if the otp is not verified and the timeout is true, then the resend button will be enabled
                    onTap: _authStateController.timedOut.value == true &&
                            otpVerified == false
                        ? () async {
                            await _authStateController.sendOtp(
                                "+91$phoneNumber",
                                redrictToVerification: false);
                          }
                        : null,
                    child: Text(
                      "Resend Again.",
                      style: TextStyle(
                        fontSize: 16,
                        color: _authStateController.timedOut.value == true
                            ? AppColors.primary
                            : AppColors.lightTextColor.withOpacity(0.6),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
