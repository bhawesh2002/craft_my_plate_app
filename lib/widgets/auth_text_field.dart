import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/enums.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final AuthType authType;
  final TextEditingController authController;
  final FocusNode authFocusNode;
  const AuthTextField(
      {super.key,
      required this.authController,
      required this.authFocusNode,
      required this.authType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.textFieldBorderColor)),
          child: SizedBox.square(
            dimension: 40,
            child: Center(
              child: authType == AuthType.phone
                  ? const Text("+91")
                  : const Icon(Icons.email),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.textFieldBorderColor)),
            child: TextField(
              controller: authController,
              focusNode: authFocusNode,
              keyboardType: authType == AuthType.phone
                  ? TextInputType.phone
                  : TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: authType == AuthType.phone
                    ? "Enter phone number"
                    : "Enter your email",
                hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
