import '../../core/config/use_case_config.dart';
import '../../core/constants/api_params.dart';
import '../entity/search_response.dart';
import '../repository/omdb_repository.dart';

class SearchForTitleMarvel implements UseCase<SearchResponse, int> {
  final OMDbRepository _repository;

  SearchForTitleMarvel({required OMDbRepository repository}) : _repository = repository;

  @override
  Future<SearchResponse> execute(int params) async {
    Map<String, dynamic> queryParams = {
      ApiParams.kSearch: "marvel",
      ApiParams.kPage: params.toString(),
    };
    try {
      final data = await _repository.searchWithTitle(queryParams);
      return data;
    } catch (_) {
      rethrow;
    }
  }
}