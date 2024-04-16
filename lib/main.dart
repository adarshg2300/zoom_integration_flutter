import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zoom_sdk_flutter/data/data_source/remote_data_source.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/language_change_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/screenBloc.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/splash_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/tutorial_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/CategoryVideo.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/home_data_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/onboarding/ChooseLanguageScreen.dart';
import 'package:zoom_sdk_flutter/presentation/viewModel/screenViewModel.dart';
import 'package:zoom_sdk_flutter/res/component/size_confige.dart';
import 'package:zoom_sdk_flutter/res/utils/SharePreferanceHelper.dart';
import 'package:zoom_sdk_flutter/res/utils/app_routes.dart';
import 'core/network/network_handler.dart';
import 'domain/repositories/video_repository.dart';
import 'domain/usecases/fetch_video_list_usecase.dart';
// Initialize GetIt instance as global
final GetIt getIt = GetIt.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

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
  getIt.registerLazySingleton(() => SplashBloc());
  getIt.registerLazySingleton(() => LanguageChangeBloc());
  getIt.registerLazySingleton(() => TutorialBloc());
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
        initialRoute: '/splash',
        routes: AppRoutes.define(),
    );
  }
}




