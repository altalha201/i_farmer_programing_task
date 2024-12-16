import 'rating_entity.dart';

class ContentDetails {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<RatingEntity>? ratings;
  String? metaScore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? boxOffice;
  String? response;

  ContentDetails({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metaScore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.boxOffice,
    this.response,
  });
}
