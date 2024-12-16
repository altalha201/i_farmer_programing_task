import '../../core/constants/api_params.dart';
import '../../domain/entity/content_details.dart';
import '../../domain/entity/search_response.dart';
import '../../domain/repository/omdb_repository.dart';
import '../model/content_details_model.dart';
import '../model/search_response_model.dart';
import '../source/api/api.dart';

class OMDbRepoImp implements OMDbRepository{
  final ApiSource _api;

  OMDbRepoImp({required ApiSource api}) : _api = api;

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

  @override
  Future<ContentDetails> getDetails(String imdbId) async {
    Map<String, dynamic> params = {
      ApiParams.kIMDbId: imdbId,
    };
    try {
      final response = await _api.getResponseFromOMDb(params);
      final data = ContentDetailsModel.fromJson(response);
      return data;
    } catch (_) {
      rethrow;
    }
  }
}