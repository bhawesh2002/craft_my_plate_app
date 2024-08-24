import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passController;
  final FocusNode passFocusNode;
  const PasswordTextField(
      {super.key, required this.passController, required this.passFocusNode});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.textFieldBorderColor)),
          child: const SizedBox.square(
            dimension: 40,
            child: Center(
              child: Icon(Icons.key),
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
              controller: passController,
              focusNode: passFocusNode,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: "Enter Your Password",
                hintStyle: TextStyle(fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
