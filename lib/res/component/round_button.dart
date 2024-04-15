import 'package:flutter/material.dart';

import '../colors/app_color.dart';


class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      this.loading = false,
      required this.title,
      this.height = 40,
      this.width = 80,
      required this.onPress,
      this.textColor = AppColors.whiteColor,
      this.buttoncolor = AppColors.purple});

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttoncolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  title,
                  style:
                      TextStyle(color: textColor, backgroundColor: buttoncolor),
                ),
              ),
      ),
    );
  }
}
