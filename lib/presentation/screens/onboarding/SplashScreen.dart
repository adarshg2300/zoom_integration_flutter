import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/component/comman_widget.dart';
import '../../../res/component/size_confige.dart';
import '../../../res/strings/strings.dart';
import '../../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final bloc = getIt<SplashBloc>();

  @override
  Widget build(BuildContext context) {
    bloc.navigateToTutorial.listen((navigate) {
      if (navigate) {
        Navigator.pushReplacementNamed(context, '/changeLanguage');
      }
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          CommonWidgets.buildBackgroundImage(
            ImageAssets.splashBg,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonWidgets.buildImage(
                      ImageAssets.logo,
                      SizeConfig.screenWidth * .3,
                      SizeConfig.screenHeight * 0.15,
                      BoxFit.fill),
                  const SizedBox(height: 20),
                  CommonWidgets.buildText(Strings.welcomeToMoney9, 22,
                      FontWeight.bold, Colors.white),
                  CommonWidgets.buildSvgImage(
                    ImageAssets.superLogoSvg,
                    SizeConfig.screenWidth * .0,
                    SizeConfig.screenHeight * 0.13,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
