import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/video_event.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/video_state.dart';

import '../../domain/usecases/fetch_video_list_usecase.dart';

class VideoListBloc extends Bloc<VideoListEvent, VideoListState> {
  final FetchVideoListUsecase fetchVideoListUsecase;

  VideoListBloc(this.fetchVideoListUsecase) : super(VideoListInitial()){
    on<FetchVideoListEvent>(fetchVideoListEvent);
  }

  FutureOr<void> fetchVideoListEvent(FetchVideoListEvent event, Emitter<VideoListState> emit) async{
    if (event is FetchVideoListEvent) {
      emit(VideoListLoading());
      try {
        final videoListData = await fetchVideoListUsecase.execute();
        print("dfjsdkjksj1${videoListData}");
        emit(VideoListLoaded(videoListData));
      } catch (e) {
        print("dfjsdkjksj1erroo");
        emit(VideoListError('Failed to fetch video list: $e'));
      }
    }
  }
}
