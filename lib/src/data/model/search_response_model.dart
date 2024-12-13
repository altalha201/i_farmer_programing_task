import '../../domain/entity/search_entity.dart';
import '../../domain/entity/search_response.dart';
import 'search_model.dart';

class SearchResponseModel extends SearchResponse {
  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <SearchEntity>[];
      json['Search'].forEach((v) {
        search!.add(SearchModel.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }
}