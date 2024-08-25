import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/enums.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/app_snackbars.dart';
import 'package:craft_my_plate_app/widgets/auth_text_field.dart';
import 'package:craft_my_plate_app/widgets/password_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthStateController _authStateController =
      Get.find<AuthStateController>();

  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _passController = TextEditingController();
  final FocusNode _passFocusNode = FocusNode();
  AuthType authType = AuthType.phone;
  bool isPhoneValid = true;
  bool isEmailValid = true;
  bool isPassValid = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
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
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (authType != AuthType.phone) {
                      setState(() {
                        authType = AuthType.phone;
                      });
                    }
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: authType == AuthType.phone
                        ? AppColors.primary
                        : Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: authType == AuthType.phone ? 10 : 0,
                    shadowColor: authType == AuthType.phone
                        ? AppColors.primary.withOpacity(0.8)
                        : Colors.grey.shade600,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: authType == AuthType.phone
                        ? Colors.white
                        : AppColors.primary,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (authType != AuthType.email) {
                      setState(() {
                        authType = AuthType.email;
                      });
                    }
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: authType == AuthType.email
                        ? AppColors.primary
                        : Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: authType == AuthType.email ? 10 : 0,
                    shadowColor: authType == AuthType.email
                        ? AppColors.primary.withOpacity(0.8)
                        : Colors.grey.shade600,
                  ),
                  child: Icon(Icons.email,
                      color: authType == AuthType.email
                          ? Colors.white
                          : AppColors.primary),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log In or Sign Up with Craft My Plate",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: authType == AuthType.phone
                        ? AuthTextField(
                            key: const ValueKey(AuthType.phone),
                            authController: _phoneController,
                            authFocusNode: _phoneFocusNode,
                            authType: AuthType.phone,
                          )
                        : AuthTextField(
                            key: const ValueKey(AuthType.email),
                            authController: _emailController,
                            authFocusNode: _emailFocusNode,
                            authType: AuthType.email,
                          ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SizeTransition(
                          sizeFactor: animation,
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      key: ValueKey(authType),
                      children: [
                        if (authType == AuthType.email)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              child: PasswordTextField(
                                  passController: _passController,
                                  passFocusNode: _passFocusNode),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (authType == AuthType.phone &&
                          _phoneController.text.trim().length != 10) {
                        setState(() {
                          isPhoneValid = false;
                        });
                        errorSnackBar(
                            title: "Enter Valid Phone Number",
                            message: "Please enter a valid phone number");

                        return;
                      } else {
                        setState(() {
                          isPhoneValid = true;
                        });
                      }
                      if (authType == AuthType.email &&
                          !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                              .hasMatch(_emailController.text.trim())) {
                        setState(() {
                          isEmailValid = false;
                        });
                        errorSnackBar(
                            title: "Enter Valid Email",
                            message: "Please enter a valid email address");
                        return;
                      } else {
                        setState(() {
                          isEmailValid = true;
                        });
                      }
                      if (authType == AuthType.email &&
                          !RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$")
                              .hasMatch(_passController.text.trim())) {
                        setState(() {
                          isPassValid = false;
                        });
                        errorSnackBar(
                            title: ' Enter Valid Password',
                            message:
                                'Password must contain at least 6 characters, 1 letter, 1 number and 1 special character');
                        return;
                      } else {
                        setState(() {
                          isPassValid = true;
                        });
                      }

                      if (authType == AuthType.phone) {
                        await _authStateController
                            .sendOtp("+91${_phoneController.text.trim()}");
                        return;
                      }
                      if (authType == AuthType.email &&
                          isEmailValid &&
                          isPassValid) {
                        await _authStateController
                            .signInWithEmail(_emailController.text.trim(),
                                _passController.text.trim())
                            .then((_) {
                          if (_authStateController.isNewUser.value == true) {
                            Get.toNamed(AppRoutes.infoCollection);
                          } else if (FirebaseAuth
                                      .instance.currentUser?.displayName ==
                                  null ||
                              FirebaseAuth.instance.currentUser?.email ==
                                  null) {
                            debugPrint(
                                "User is not new and name and email is null");
                            Get.toNamed(AppRoutes.infoCollection);
                          } else {
                            Get.offAllNamed(AppRoutes.home);
                          }
                        });
                        return;
                      }
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
