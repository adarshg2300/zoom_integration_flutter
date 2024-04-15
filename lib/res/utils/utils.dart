import 'package:flutter/cupertino.dart';
/*
import 'package:flutter_basic_architecture/res/colors/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
*/

class Utils {
  //Change focus
  static void fieldChangeFocus(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

 /* //Show toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: AppColors.blackColor);
  }

  //Show Snackbar
  static showSnackBar(String title, String message) {
    Get.snackbar(title, message);
  }*/
}
