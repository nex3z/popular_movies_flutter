import 'package:popular_movies_flutter/data/client/client.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/secrets.dart';
import 'package:rxdart/rxdart.dart';

class MovieRepository {
  final Client _client = Client(API_KEY);

  Observable<List<Movie>> discoverMovies({int page, String sortBy = 'popularity.desc'}) {
    return Observable.fromFuture(_client.discoverMovies(page, sortBy));
  }

}