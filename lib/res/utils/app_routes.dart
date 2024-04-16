import 'package:flutter/cupertino.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/LoginScreen.dart';
import '../../presentation/screens/onboarding/ChooseLanguageScreen.dart';
import '../../presentation/screens/onboarding/SplashScreen.dart';
import '../../presentation/screens/onboarding/TutorialScreen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> define() {
    return {
      '/splash': (context) => SplashScreen(),
      '/tutorial': (context) => const TutorialScreen(),
      '/changeLanguage': (context) => const LanguageSelectionScreen(),
      '/login': (context) =>  LoginScreen(),
      // Add more routes here if needed
    };
  }
}