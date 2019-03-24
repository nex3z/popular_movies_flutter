import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/discover/discover_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DiscoverBloc _bloc = DiscoverBloc();

  @override
  void initState() {
    super.initState();
    _bloc.discoverMovies();
  }

  Widget _buildMovieGrid(List<Movie> movies) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Container(
        child: StreamBuilder<List<Movie>>(
          stream: _bloc.movieSubject.stream,
          builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.hasData) {
              return _buildMovieGrid(snapshot.data);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
