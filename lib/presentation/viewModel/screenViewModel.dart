import 'package:flutter/cupertino.dart';
import '../../domain/model/screens.dart';
import '../bloc/screenBloc.dart';

class AppViewModel extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final ScreenBloc bloc;

  AppViewModel(this.bloc);

  void navigateToScreen(String screenName) {
    bloc.add(Screen(screenName));
  }
}