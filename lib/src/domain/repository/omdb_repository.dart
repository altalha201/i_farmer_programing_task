import '../entity/content_details.dart';
import '../entity/search_response.dart';

abstract class OMDbRepository {
  Future<SearchResponse> searchWithTitle(Map<String, dynamic> params);

  Future<ContentDetails> getDetails(String imdbId);
}