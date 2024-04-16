import 'dart:async';

class TutorialBloc {
  final _navigateToTutorialController = StreamController<bool>.broadcast();

  Stream<bool> get navigateToTutorial => _navigateToTutorialController.stream;

 void tutorialBloc() {
      _navigateToTutorialController.sink.add(true);
  }
  dispose() {
    _navigateToTutorialController.close();
  }
}