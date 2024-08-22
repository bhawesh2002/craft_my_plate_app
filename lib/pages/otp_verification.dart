import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "+91-XXXXXX6794",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, height: 2.4),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.verified_rounded,
                  color: AppColors.verifiedColor,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.textFieldBorderColor,
              fieldWidth: 50,
              focusedBorderColor: AppColors.primary,
              disabledBorderColor: AppColors.textFieldBorderColor,
              textStyle: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Didn’t receive code?",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "Resend Again.",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
