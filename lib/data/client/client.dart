import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie_response.dart';

class Client {
  static const String BASE_URL = 'https://api.themoviedb.org/';
  final String _apiKey;
  final Dio _dio = Dio();

  Client(this._apiKey) {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 5000;
//    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  Future<List<Movie>> discoverMovies2({int page = 1, String sortBy = 'popularity.desc'}) {
    return http.get('$BASE_URL/3/discover/movie?page=$page&sort_by=$sortBy&api_key=$_apiKey')
        .then((response) => response.body)
        .then((jsonString) => jsonDecode(jsonString))
        .then((jsonMap) => MovieResponse.fromJson(jsonMap))
        .then((resp) => resp.results);
  }

  Future<List<Movie>> discoverMovies(int page, String sortBy) {
    var params = {
      'page': page,
      'sortBy': sortBy,
      'api_key': _apiKey
    };
    return _dio.get('3/discover/movie', queryParameters: params)
        .then((response) => response.data)
        .then((jsonMap) => MovieResponse.fromJson(jsonMap))
        .then((resp) { print(resp); return resp.results;});
  }
}