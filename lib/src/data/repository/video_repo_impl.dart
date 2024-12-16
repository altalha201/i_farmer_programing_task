import '../../domain/repository/video_repository.dart';
import '../source/local/video_url_list.dart';
import '../../core/config/configs.dart';

class VideoRepoImpl implements VideoRepository {
  @override
  String getRandomVideo() {
    return VideoUrlList.videoUrls.random();
  }
}