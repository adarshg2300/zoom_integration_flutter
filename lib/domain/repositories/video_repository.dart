
import '../../data/data_source/remote_data_source.dart';
import '../entities/video_list_data.dart';

class VideoRepository {
  final RemoteDataSource remoteDataSource;

  VideoRepository(this.remoteDataSource);

  Future<VideoListData> fetchVideoList() async {
    try {
      final url = 'https://ottacceleratordev.appskeeper.in/media/v1/videos/home';
      final headers = {
        'accept': '*/*',
        'Accept-Language': 'EN',
        'Timezone': 'Asia/Kolkata',
        'Platform': '1',
      };
      final jsonData = await remoteDataSource.fetchData(url, headers);
      return VideoListData.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to fetch video list: $e');
    }
  }
}
