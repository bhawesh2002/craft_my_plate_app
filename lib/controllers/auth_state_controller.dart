import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isVerified = false.obs;
  RxString verificationIdStr = "".obs;
  RxBool otpSent = false.obs;

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
        debugPrint("Login Status: User is currently signed out!");
      } else {
        isLoggedIn.value = true;
        debugPrint("Login Status: User is signed in!");
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
          isVerified.value = true;
          debugPrint("sendOtp(): User signed in!");
        },
        verificationFailed: (FirebaseAuthException e) {
          isVerified.value = false;
          debugPrint("sendOtp(): Error: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationIdStr.value = verificationId;
          otpSent.value = true;
          debugPrint("sendOtp():Code sent to $phoneNumber");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint("sendOtp():Auto retrieval timeout");
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
      isVerified.value = true;
      otpSent.value = false;
      debugPrint("verifyOtp(): User signed in!");
    } catch (e) {
      debugPrint("sendOtp()Error: $e");
    }
  }

  Future<void> updateProfile(String name, String email) async {
    try {
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.updateEmail(email);
      debugPrint("Profile updated!");
    } catch (e) {
      debugPrint("updateProfile()Error: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      debugPrint("User signed out!");
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      debugPrint("signOut()Error: $e");
    }
  }
}
