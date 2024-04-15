
import '../entities/video_list_data.dart';
import '../repositories/video_repository.dart';

class FetchVideoListUsecase {
  final VideoRepository videoRepository;

  FetchVideoListUsecase(this.videoRepository);

  Future<VideoListData> execute() async {
    return await videoRepository.fetchVideoList();
  }
}
