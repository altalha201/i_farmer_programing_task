import '../entity/search_response.dart';

abstract class SearchRepository {
  Future<SearchResponse> searchWithTitle(Map<String, dynamic> params);
}