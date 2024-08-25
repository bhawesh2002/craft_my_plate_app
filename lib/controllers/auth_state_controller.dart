import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/widgets/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStateController extends GetxController {
  RxBool isLoggedIn = false.obs;

  //Phone Auth Related
  final RxString _verificationIdStr = "".obs;
  RxBool isVerified = false.obs;
  RxBool otpSent = false.obs;

  RxBool isNewUser = false.obs;

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
        debugPrint("Login Status: ${user.uid} is signed in!");
      }
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCred.user != null) {
        isLoggedIn.value = true;
        //Since only existing users can sign in, we set isNewUser to false
        isNewUser.value = userCred.additionalUserInfo!.isNewUser;
      }
      debugPrint("signInWithEmail(): User signed in!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint(
            "signInWithEmail() Error: User not found! Attempting to sign up...");
        // Attempt to sign up the user if user is not found
        await _signUpWithEmail(email, password);
      } else if (e.code == 'wrong-password') {
        isLoggedIn.value = false;
        debugPrint("signInWithEmail() Error: Wrong password provided!");
        errorSnackBar(title: "Error", message: "Wrong password provided!");
      } else {
        debugPrint("signInWithEmail() Undefined Firebase Error: ${e.message}");
      }
    } catch (e) {
      debugPrint("signInWithEmail() Undefined Error: $e");
      isLoggedIn.value = false;
    }
  }

  // Private method which will be called if the sign-in throws a user-not-found error
  // This method will attempt to sign up the user with the provided email and password
  Future<void> _signUpWithEmail(String email, String password) async {
    try {
      // Attempt to create a new user with the provided email and password
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCred.user != null) {
        isLoggedIn = true.obs;
        isNewUser.value = userCred.additionalUserInfo!
            .isNewUser; // Since the user just signed up, we set isNewUser to true
      }
      debugPrint("signUpWithEmail(): User signed up and logged in!");
    } on FirebaseAuthException catch (e) {
      debugPrint("signUpWithEmail() Error: ${e.message}");
      errorSnackBar(
          title: "Error",
          message: e.message ?? "An error occurred during sign-up.");
    } catch (e) {
      debugPrint("signUpWithEmail() Undefined Error: $e");
      errorSnackBar(
          title: "Error",
          message: "An unexpected error occurred during sign-up.");
    }
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      otpSent.value = false;
      isVerified.value = false;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCred =
              await _auth.signInWithCredential(credential);
          if (userCred.user != null) {
            isVerified.value = true;
            isLoggedIn.value = true;
            //Check if the user is new or not
            isNewUser.value = userCred.additionalUserInfo!.isNewUser;
          }
          debugPrint("sendOtp() isNewUser: ${isNewUser.value}");
          debugPrint("sendOtp(): User signed in automatically!");
        },
        verificationFailed: (FirebaseAuthException e) {
          isVerified.value = false;
          isLoggedIn.value = false;
          debugPrint("sendOtp() Error: ${e.message}");
          errorSnackBar(
              title: "Error Sending OTP",
              message: "We encountered an error while sending the OTP.\n$e");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationIdStr.value = verificationId;
          otpSent.value = true;
          infoSnackBar(
              title: "Otp Sent Successfully",
              message: "We have sent an OTP to $phoneNumber");

          Get.toNamed(AppRoutes.verification,
              arguments: phoneNumber.replaceRange(0, 3, ''));

          debugPrint("sendOtp(): Code sent to $phoneNumber");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationIdStr.value = verificationId;
          otpSent.value = false;
          debugPrint("sendOtp(): Auto retrieval timeout");
        },
      );
    } catch (e) {
      errorSnackBar(
          title: "Error Sending OTP",
          message: "We encountered an error while sending the OTP.$e.");
      debugPrint("sendOtp() Error: $e");
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      isVerified.value = false;
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationIdStr.value,
        smsCode: otp,
      );
      UserCredential userCred = await _auth.signInWithCredential(credential);
      if (userCred.user != null) {
        isVerified.value = true;
        isLoggedIn.value = true;
        //Check if the user is new or not
        isNewUser.value = userCred.additionalUserInfo!.isNewUser;
      }
      otpSent.value = false;
      debugPrint("sendOtp() isNewUser: ${isNewUser.value}");
      debugPrint("verifyOtp(): User signed in!");
    } catch (e) {
      debugPrint("verifyOtp() Error: $e");
    }
  }

  Future<void> updateProfile(String name, String email) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.updateEmail(email);

        debugPrint("updateProfile(): Profile updated!");
      }
    } catch (e) {
      debugPrint("updateProfile() Error: $e");
    }
  }

  Future<void> signOut({bool redirectToLogin = false}) async {
    try {
      await _auth.signOut();
      isLoggedIn.value = false;
      debugPrint("signOut(): User signed out!");
      if (redirectToLogin) {
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      debugPrint("signOut() Error: $e");
    }
  }
}
