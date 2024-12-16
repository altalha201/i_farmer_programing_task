import '../../core/config/configs.dart';
import '../../core/constants/api_params.dart';
import '../entity/search_entity.dart';
import '../repository/omdb_repository.dart';

class GetBatmanContent implements UseCase<List<SearchEntity>, Map<String, dynamic>> {
  final OMDbRepository _repo;

  GetBatmanContent(this._repo);

  @override
  Future<List<SearchEntity>> execute(Map<String, dynamic> params) async {
    try {
      params[ApiParams.kSearch] = "batman";
      final responseData = await _repo.searchWithTitle(params);
      return responseData.search ?? [];
    } catch (_) {
      rethrow;
    }
  }
}