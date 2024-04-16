import 'dart:async';

class LoginBloc {
  final _navigateToLoginController = StreamController<bool>.broadcast();
  Stream<bool> get navigateToLoginController => _navigateToLoginController.stream;

  void navigateToTutorial() {
    _navigateToLoginController.sink.add(true);
  }

  dispose() {
    _navigateToLoginController.close();
  }
}