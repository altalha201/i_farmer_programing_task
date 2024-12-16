import '../../core/config/configs.dart';
import '../entity/content_details.dart';
import '../repository/omdb_repository.dart';

class GetFullDetails implements UseCase<ContentDetails, String> {
  final OMDbRepository _repo;

  GetFullDetails(this._repo);

  @override
  Future<ContentDetails> execute(String params) async {
    try {
      final data = await _repo.getDetails(params);
      return data;
    } catch (_) {
      rethrow;
    }
  }
}