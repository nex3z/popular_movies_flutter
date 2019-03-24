import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';

class MovieGridWidget extends StatelessWidget {
  final List<Movie> movies;

  const MovieGridWidget({Key key, this.movies}) : super(key: key);

  Widget _buildMovieItem(Movie movie) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.7,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.center,
                  image: NetworkImage(movie.getPosterImageUrl()),
                )),
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, i) {
        return _buildMovieItem(movies[i]);
      },
    );
  }

}