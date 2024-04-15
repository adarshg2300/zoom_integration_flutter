
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/screens.dart';

class ScreenBloc extends Bloc<Screen, void> {
  ScreenBloc() : super(Screen(''));

  @override
  Stream<void> mapEventToState(Screen event) async* {
    yield* event.name.isNotEmpty ? Stream.empty() : Stream.error('Invalid Screen Name');
  }
}