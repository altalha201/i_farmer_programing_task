import '../../domain/entity/content_details.dart';
import '../../domain/entity/rating_entity.dart';
import 'rating_model.dart';

class ContentDetailsModel extends ContentDetails {
  ContentDetailsModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];
    if (json['Ratings'] != null) {
      ratings = <RatingEntity>[];
      json['Ratings'].forEach((v) {
        ratings!.add(RatingModel.fromJson(v));
      });
    }
    metaScore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    type = json['Type'];
    boxOffice = json['BoxOffice'];
    response = json['Response'];
  }
}