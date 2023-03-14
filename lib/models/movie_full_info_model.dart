import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_full_info_model.g.dart';

@JsonSerializable()
class MovieFullInfoModel with ChangeNotifier {
  String title;
  String released;
  String director;
  String plot;
  String poster;
  List<Ratings> ratings;

  MovieFullInfoModel(
      {required this.title,
      required this.released,
      required this.director,
      required this.plot,
      required this.poster,
      required this.ratings});

  factory MovieFullInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieFullInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFullInfoModelToJson(this);

  @override
  String toString() {
    return "$title, $released, $director, $plot,$poster, $ratings";
  }
}

@JsonSerializable()
class Ratings {
  String source;
  String value;

  Ratings({required this.source, required this.value});

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsToJson(this);

  @override
  String toString() {
    return "$source : $value";
  }
}
