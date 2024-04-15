import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_color.dart';




class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress}): super(key: key);

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * .15,
            ),
            const Icon(
              Icons.cloud_off,
              color: AppColors.red,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Center(child: Text('internet_exception',textAlign: TextAlign.center,)),
            ),
            SizedBox(
              height: height * .05,
            ),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                height: 44,
                width: 160,
                decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text('retry',
                      style: const TextStyle(
                          backgroundColor: AppColors.purple,
                          color: AppColors.whiteColor)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
