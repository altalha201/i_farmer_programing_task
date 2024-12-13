import '../../domain/entity/search_response.dart';
import '../../domain/repository/search_repository.dart';
import '../model/search_response_model.dart';
import '../source/api.dart';

class SearchRepoImp implements SearchRepository{
  final ApiSource _api;

  SearchRepoImp({required ApiSource api}) : _api = api;

  @override
  Future<SearchResponse> searchWithTitle(Map<String, dynamic> params) async {
    try {
      final responseData = await _api.getResponseFromOMDb(params);
      final data = SearchResponseModel.fromJson(responseData);
      return data;
    } catch (_) {
      rethrow;
    }
  }
}