import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/widgets/app_snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCollectionPage extends StatefulWidget {
  const InfoCollectionPage({super.key});

  @override
  State<InfoCollectionPage> createState() => _InfoCollectionPageState();
}

class _InfoCollectionPageState extends State<InfoCollectionPage> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  final AuthStateController _authStateController =
      Get.find<AuthStateController>();

  bool updateWorkflowTriggered = false;

  @override
  void initState() {
    FirebaseAuth.instance.currentUser?.email != null
        ? _emailController.text = FirebaseAuth.instance.currentUser!.email!
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Just a step away !",
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.textFieldBorderColor)),
              child: TextField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Full Name*",
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.textFieldBorderColor)),
              child: TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                enabled: FirebaseAuth.instance.currentUser?.email == null,
                decoration: const InputDecoration(
                  hintText: "Email ID*",
                  hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  updateWorkflowTriggered = true;
                });
                if (_nameController.text.isEmpty ||
                    _emailController.text.isEmpty) {
                  errorSnackBar(
                      title: "Fields Cannot Be Empty",
                      message: "Please fill in your Name and Email Address");
                  setState(() {
                    updateWorkflowTriggered = false;
                  });
                  return;
                } else if (!RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                    .hasMatch(_emailController.text.trim())) {
                  errorSnackBar(
                      title: "Invalid Email",
                      message:
                          "Email is badly formatter please correct the email");
                }
                await _authStateController
                    .updateProfile(_nameController.text, _emailController.text)
                    .then((_) {
                  if (FirebaseAuth.instance.currentUser?.displayName != null &&
                      FirebaseAuth.instance.currentUser?.email != null) {
                    Get.offAllNamed(AppRoutes.home);
                  }
                });
                setState(() {
                  updateWorkflowTriggered = false;
                });
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
                child: updateWorkflowTriggered
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
          ],
        ),
      ),
    );
  }
}
