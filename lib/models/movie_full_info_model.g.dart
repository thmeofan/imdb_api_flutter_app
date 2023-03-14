// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_full_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieFullInfoModel _$MovieFullInfoModelFromJson(Map<String, dynamic> json) =>
    MovieFullInfoModel(
      title: json['Title'] as String,
      released: json['Released'] as String,
      director: json['Director'] as String,
      plot: json['Plot'] as String,
      poster: json['Poster'] as String,
      ratings: (json['Ratings'] as List<dynamic>)
          .map((e) => Ratings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieFullInfoModelToJson(MovieFullInfoModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Released': instance.released,
      'Director': instance.director,
      'Plot': instance.plot,
      'Poster': instance.poster,
      'Ratings': instance.ratings,
    };

Ratings _$RatingsFromJson(Map<String, dynamic> json) => Ratings(
      source: json['Source'] as String,
      value: json['Value'] as String,
    );

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'Source': instance.source,
      'Value': instance.value,
    };
