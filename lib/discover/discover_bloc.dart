import 'package:popular_movies_flutter/base/base_request_bloc.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/data/repository/movie_repository.dart';

import 'package:rxdart/rxdart.dart';

class DiscoverBloc extends BaseRequestBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List<Movie>> movieSubject = BehaviorSubject();
  final List<Movie> _movies = [];

  @override
  void dispose() {
    super.dispose();
    movieSubject.close();
  }

  void discoverMovies() {
    _repository.discoverMovies(page: 1)
        .listen(onSuccess, onError: onError);
  }

  void onSuccess(List<Movie> movies) {
    this._movies.addAll(movies);
    this.movieSubject.sink.add(this._movies);
  }

}
