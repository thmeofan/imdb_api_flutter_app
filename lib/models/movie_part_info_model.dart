import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_part_info_model.g.dart';

@JsonSerializable()
class MoviePartInfoModel with ChangeNotifier {
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  MoviePartInfoModel(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.poster});

  factory MoviePartInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MoviePartInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePartInfoModelToJson(this);

  @override
  String toString() {
    return "$title, $year, $imdbID, $type,$poster";
  }
}
