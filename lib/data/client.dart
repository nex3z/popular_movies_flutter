import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie_response.dart';

class Client {
  static const String BASE_URL = 'https://api.themoviedb.org';
  final String _apiKey;

  Client(this._apiKey);

  Future<List<Movie>> discoverMovies({int page = 1, String sortBy = 'popularity.desc'}) {
    return http.get('$BASE_URL/3/discover/movie?page=$page&sort_by=$sortBy&api_key=$_apiKey')
        .then((response) => response.body)
        .then((jsonString) => jsonDecode(jsonString))
        .then((jsonMap) => MovieResponse.fromJson(jsonMap))
        .then((resp) => resp.results);
  }

}