import 'package:craft_my_plate_app/controllers/auth_state_controller.dart';
import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/app_icons.dart';
import 'package:craft_my_plate_app/utils/app_svgs.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CmpBottomAppBar extends StatefulWidget {
  const CmpBottomAppBar({super.key});

  @override
  State<CmpBottomAppBar> createState() => _CmpBottomAppBarState();
}

class _CmpBottomAppBarState extends State<CmpBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    final UiSizes uiSizes = UiSizes();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: uiSizes.w4),
          GestureDetector(
            onTap: () async {
              // Logout the user when profile icon is tapped
              await Get.put(AuthStateController())
                  .signOut(redirectToLogin: true);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.userCircle),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: uiSizes.responsiveFontSize(12),
                    color: AppColors.lightTextColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: uiSizes.w6),
          Transform.scale(
              scale: 1.2, child: SvgPicture.asset(AppSvgs.logoCircleSVG)),
          SizedBox(width: uiSizes.w6),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.dinnerPlate),
              Text(
                "Orders",
                style: TextStyle(
                  fontSize: uiSizes.responsiveFontSize(12),
                  color: AppColors.lightTextColor,
                ),
              )
            ],
          ),
          SizedBox(width: uiSizes.w4),
        ],
      ),
    );
  }
}
