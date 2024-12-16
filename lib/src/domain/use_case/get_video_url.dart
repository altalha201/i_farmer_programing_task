import '../../core/config/configs.dart';
import '../repository/video_repository.dart';

class GetVideoUrl implements UseCase<String, NoParams> {
  final VideoRepository _repo;

  GetVideoUrl(this._repo);

  @override
  Future<String> execute(NoParams params) async {
    return _repo.getRandomVideo();
  }
}