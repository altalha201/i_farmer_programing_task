import '../../domain/entity/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }
}