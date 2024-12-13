import '../../core/config/use_case_config.dart';
import '../../core/constants/api_params.dart';
import '../entity/search_response.dart';
import '../repository/search_repository.dart';

class SearchForTitleMarvel implements UseCase<SearchResponse, int> {
  final SearchRepository _repository;

  SearchForTitleMarvel({required SearchRepository repository}) : _repository = repository;

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