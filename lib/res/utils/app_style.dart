import 'package:flutter/material.dart';
import '../colors/app_color.dart';


class AppStyle {

  static TextStyle? get titleStyle {
    return const TextStyle(
      color: AppColors.whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle? get whiteBold16 {
    return const TextStyle(
      color: AppColors.blackColor,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle semiBoldBlack(double size) {
    return TextStyle(
      //fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
      fontSize: size,
    );
  }

}
