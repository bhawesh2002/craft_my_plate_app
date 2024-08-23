import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isVerified = false.obs;
  RxString verificationIdStr = "".obs;
  RxBool otpRequested = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> checkLoginStatus() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn.value = false;
        debugPrint("User is currently signed out!");
      } else {
        isLoggedIn.value = true;
        debugPrint("User is signed in!");
      }
    });
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          debugPrint("User signed in!");
          isVerified.value = true;
          otpRequested.value = false;
          Get.offAllNamed(AppRoutes.home);
        },
        verificationFailed: (FirebaseAuthException e) {
          otpRequested.value = false;
          debugPrint("Error: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          debugPrint("Code sent to $phoneNumber");
          verificationIdStr.value = verificationId;
          otpRequested.value = true;
          Get.toNamed(AppRoutes.verification, arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          otpRequested.value = false;
          debugPrint("Auto retrieval timeout");
        },
      );
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      debugPrint("User signed in!");
      isVerified.value = true;
      otpRequested.value = false;
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    debugPrint("User signed out!");
    Get.offAllNamed(AppRoutes.login);
  }
}
