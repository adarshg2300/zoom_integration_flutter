import '../../../domain/entities/video_list_data.dart';

abstract class VideoListState {}

class VideoListInitial extends VideoListState {}

class VideoListLoading extends VideoListState {}

class VideoListLoaded extends VideoListState {
  final VideoListData videoListData;
  VideoListLoaded(this.videoListData);
}

class VideoListError extends VideoListState {
  final String errorMessage;
  VideoListError(this.errorMessage);
}
