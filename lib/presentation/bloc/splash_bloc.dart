import 'dart:async';

class SplashBloc {
  final _navigateToTutorialController = StreamController<bool>.broadcast();

  Stream<bool> get navigateToTutorial => _navigateToTutorialController.stream;

  SplashBloc() {
    Timer(const Duration(seconds: 5), () {
      _navigateToTutorialController.sink.add(true);
    });
  }

  dispose() {
    _navigateToTutorialController.close();
  }
}
