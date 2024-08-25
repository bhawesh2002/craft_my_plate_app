import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/enums.dart';
import 'package:flutter/material.dart';

class AuthTypeButton extends StatelessWidget {
  final AuthType authType;
  final AuthType currentAuthType;
  final IconData icon;
  final VoidCallback onPressed;

  const AuthTypeButton({
    super.key,
    required this.authType,
    required this.currentAuthType,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            authType == currentAuthType ? AppColors.primary : Colors.white,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: authType == currentAuthType ? 10 : 0,
        shadowColor: authType == currentAuthType
            ? AppColors.primary.withOpacity(0.8)
            : Colors.grey.shade600,
      ),
      child: Icon(
        icon,
        color: authType == currentAuthType ? Colors.white : AppColors.primary,
      ),
    );
  }
}
