import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/discover/discover_bloc.dart';
import 'package:popular_movies_flutter/discover/movie_grid_widget.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverBloc _bloc = DiscoverBloc();

  @override
  void initState() {
    super.initState();
    _bloc.discoverMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder<List<Movie>>(
        stream: _bloc.movieSubject.stream,
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return MovieGridWidget(
              movies: snapshot.data,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
