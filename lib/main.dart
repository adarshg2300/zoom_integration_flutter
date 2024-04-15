import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zoom_sdk_flutter/data/data_source/remote_data_source.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/screenBloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/CategoryVideo.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/home_data_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/ChooseLanguageScreen.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/LoginScreen.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/SplashScreen.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/TutorialScreen.dart';
import 'package:zoom_sdk_flutter/presentation/viewModel/screenViewModel.dart';
import 'package:zoom_sdk_flutter/res/component/size_confige.dart';
import 'core/network/network_handler.dart';
import 'domain/repositories/video_repository.dart';
import 'domain/usecases/fetch_video_list_usecase.dart';
// Initialize GetIt instance as global
final GetIt getIt = GetIt.instance;
void main() {
  getDependency();
  runApp(MyApp());
}

getDependency(){
  getIt.registerSingleton<NetworkHandler>(NetworkHandler());
  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource(getIt<NetworkHandler>()));
  getIt.registerSingleton<VideoRepository>(VideoRepository(getIt<RemoteDataSource>()));
  getIt.registerSingleton<FetchVideoListUsecase>(FetchVideoListUsecase(getIt<VideoRepository>()));
  getIt.registerSingleton<VideoListBloc>(VideoListBloc(getIt<FetchVideoListUsecase>()));
  getIt.registerLazySingleton(() => ScreenBloc());
  getIt.registerLazySingleton(() => AppViewModel(getIt()));
}

class MyApp extends StatelessWidget {
  final AppViewModel viewModel = getIt<AppViewModel>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LanguageSelectionScreen(),
    );
  }
}

// Add navigation logic to the main screen after a delay
void navigateToMainScreen(BuildContext context) {
  Future.delayed(Duration(seconds: 2), () {
  });
}



