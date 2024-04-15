import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
class CommonWidgets {
  static Widget buildText(String? text, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      text ?? '', // Use empty string if text is null
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
  static Widget buildTextCenter(String? text, double fontSize, FontWeight fontWeight, Color color) {
    return Center(
      child: Container(
        child: Text(
          text ?? '', // Use empty string if text is null
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  }

  static Widget buildImage(String imagePath, double width, double height, BoxFit fit) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }

  static Widget buildBackgroundImage(String imagePath, Widget child) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }

  Widget buildBackgroundSvgImage(BuildContext context,String svgPath, Widget child) {
    return Stack(
      children: [
        SvgPicture.asset(
          svgPath,
          fit: BoxFit.cover, // Use BoxFit.cover to cover the entire screen
          width: MediaQuery.of(context).size.width, // Set width to screen width
          height: MediaQuery.of(context).size.height, // Set height to screen height
        ),
        child,
      ],
    );
  }


  static Widget buildSvgImage(String imagePath, double width, double height) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      textColor: Colors.black,
    );
  }

  static Widget buildElevatedButton({
    required VoidCallback? onPressed,
    required String buttonText,
    Color? buttonColor, // Optional button color parameter
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor ?? Colors.yellow), // Use the provided color or default to yellow
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }





}