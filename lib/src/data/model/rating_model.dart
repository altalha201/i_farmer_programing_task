import '../../domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    value = json['Value'];
  }
}