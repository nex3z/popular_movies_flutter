import 'package:json_annotation/json_annotation.dart';
import 'package:popular_movies_flutter/data/entity/base_list_response.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse extends BaseListResponse {

  List<Movie> results;

  MovieResponse(id, page, totalResults, totalPages, this.results)
      : super(id, page, totalResults, totalPages);

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  @override
  String toString() {
    return 'MovieResponse{results: $results}';
  }

}
