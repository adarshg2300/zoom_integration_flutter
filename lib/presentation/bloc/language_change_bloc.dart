import 'dart:async';

class LanguageChangeBloc {
  final _navigateToTutorialController1 = StreamController<bool>.broadcast();
  Stream<bool> get navigateToTutorial1 => _navigateToTutorialController1.stream;

  void navigateToTutorial() {
    _navigateToTutorialController1.sink.add(true);
  }

  dispose() {
    _navigateToTutorialController1.close();
  }
}