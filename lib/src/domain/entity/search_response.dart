import 'search_entity.dart';

class SearchResponse {
  List<SearchEntity>? search;
  String? totalResults;
  String? response;

  SearchResponse({this.search, this.totalResults, this.response});
}
