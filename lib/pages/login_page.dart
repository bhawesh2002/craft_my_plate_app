import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_images.dart';
import 'package:craft_my_plate_app/utils/enums.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:craft_my_plate_app/widgets/app_snackbars.dart';
import 'package:craft_my_plate_app/widgets/auth_text_field.dart';
import 'package:craft_my_plate_app/widgets/auth_type_button.dart';
import 'package:craft_my_plate_app/widgets/password_text_field.dart';
import 'package:craft_my_plate_app/widgets/term_n_condition_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final TextEditingController _passController = TextEditingController();
  final FocusNode _passFocusNode = FocusNode();
  AuthType authType = AuthType.phone;
  bool isPhoneValid = true;
  bool isEmailValid = true;
  bool isPassValid = true;

  bool loginWorkflowTriggered = false;

  @override
  void initState() {
    super.initState();
  }

  // Function to validate phone number
  bool validatePhoneNumber() {
    if (_phoneController.text.trim().length != 10) {
      setState(() {
        isPhoneValid = false;
        loginWorkflowTriggered = false;
      });
      errorSnackBar(
          title: "Enter Valid Phone Number",
          message: "Please enter a valid phone number");
      return false;
    } else {
      setState(() {
        isPhoneValid = true;
      });
      return true;
    }
  }

  // Function to validate email
  bool validateEmail() {
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
        .hasMatch(_emailController.text.trim())) {
      setState(() {
        isEmailValid = false;
        loginWorkflowTriggered = false;
      });
      errorSnackBar(
          title: "Enter Valid Email",
          message: "Please enter a valid email address");
      return false;
    } else {
      setState(() {
        isEmailValid = true;
      });
      return true;
    }
  }

  // Function to validate password
  bool validatePassword() {
    if (!RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$")
        .hasMatch(_passController.text.trim())) {
      setState(() {
        isPassValid = false;
        loginWorkflowTriggered = false;
      });
      errorSnackBar(
          title: 'Enter Valid Password',
          message:
              'Password must contain at least 6 characters, 1 letter, 1 number and 1 special character');
      return false;
    } else {
      setState(() {
        isPassValid = true;
      });
      return true;
    }
  }

  // Function to handle login workflow
  Future<void> handleLogin() async {
    // if phone is selected, validate phone number
    if (authType == AuthType.phone) {
      if (!validatePhoneNumber()) return;
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          loginWorkflowTriggered = false;
        });
      });
      await _authStateController.sendOtp("+91${_phoneController.text.trim()}");
      setState(() {
        loginWorkflowTriggered = false;
      });
    }
    // if email is selected, validate email and password
    else if (authType == AuthType.email) {
      if (!validateEmail() || !validatePassword()) return;
      await _authStateController
          .signInWithEmail(
              _emailController.text.trim(), _passController.text.trim())
          .then((_) {
        if (_authStateController.isLoggedIn.value) {
          if (_authStateController.isNewUser.value == true) {
            Get.toNamed(AppRoutes.infoCollection);
          } else if (FirebaseAuth.instance.currentUser?.displayName == null ||
              FirebaseAuth.instance.currentUser?.email == null) {
            debugPrint("User is not new and name and email is null");
            Get.toNamed(AppRoutes.infoCollection);
          } else {
            Get.offAllNamed(AppRoutes.home);
          }
        }
      });
    }
    setState(() {
      loginWorkflowTriggered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            // App Logo
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MediaQuery.of(context).viewInsets.bottom == 0
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppImages.logoSVG,
                                  width: 200,
                                ),
                                SizedBox(height: UiSizes().h4),
                              ],
                            )
                          : Text(
                              "Craft My Plate",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: GoogleFonts.capriola().fontFamily,
                                color: AppColors.secondary,
                              ),
                            ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "India’s 1st Dynamic Pricing Food Catering App",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Phone Button
                //Clicking on this button will change the authType to phone
                AuthTypeButton(
                  authType: AuthType.phone,
                  currentAuthType: authType,
                  icon: Icons.phone,
                  onPressed: () {
                    if (authType != AuthType.phone) {
                      setState(() {
                        authType = AuthType.phone;
                      });
                    }
                    FocusScope.of(context).unfocus();
                  },
                ),

                const SizedBox(
                  width: 16,
                ),
                // Email Button
                //Clicking on this button will change the authType to email
                AuthTypeButton(
                  authType: AuthType.email,
                  currentAuthType: authType,
                  icon: Icons.email,
                  onPressed: () {
                    if (authType != AuthType.email) {
                      setState(() {
                        authType = AuthType.email;
                      });
                    }
                    FocusScope.of(context).unfocus();
                  },
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
                  // Phone or Email Field based on authType
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
                  // Password Field only visible when email is selected
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
                  // Continue Button
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        loginWorkflowTriggered = true;
                      });
                      await handleLogin();
                    },
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
                      child: loginWorkflowTriggered
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  //By continuing, I accept Terms of Conditions and Privacy Policy
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(width: UiSizes().w75, child: termNCond()),
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
