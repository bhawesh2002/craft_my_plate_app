import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController errorSnackBar({
  required String title,
  required String message,
}) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: Colors.red,
    dismissDirection: DismissDirection.startToEnd,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}

SnackbarController infoSnackBar({
  required String title,
  required String message,
}) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.primary,
    dismissDirection: DismissDirection.startToEnd,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}
