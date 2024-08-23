import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/routes/app_routes.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
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
              onPressed: () {
                _authStateController
                    .updateProfile(_nameController.text, _emailController.text)
                    .then((_) {
                  Get.offAllNamed(AppRoutes.home);
                });
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
                  "Let's Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
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
