// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_part_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePartInfoModel _$MoviePartInfoModelFromJson(Map<String, dynamic> json) =>
    MoviePartInfoModel(
          title: json['Title'] as String,
          year: json['Year'] as String,
          imdbID: json['imdbID'] as String,
          type: json['Type'] as String,
          poster: json['Poster'] as String,
    );

Map<String, dynamic> _$MoviePartInfoModelToJson(MoviePartInfoModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };
