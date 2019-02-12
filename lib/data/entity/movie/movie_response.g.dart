// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) {
  return MovieResponse(
      json['id'],
      json['page'],
      json['total_results'],
      json['total_pages'],
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results
    };
