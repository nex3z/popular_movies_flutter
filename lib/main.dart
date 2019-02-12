import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/data/client.dart';
import 'package:popular_movies_flutter/data/entity/movie/movie.dart';
import 'package:popular_movies_flutter/secrets.dart' as secrets;

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
  final Client client = Client(secrets.API_KEY);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    discoverMovies();
  }

  void discoverMovies() async {
    print("discoverMovies(): start");
    var movies = await widget.client.discoverMovies();
    setState(() {
      _movies = movies == null ? [] : movies;
    });
  }

  Widget _buildMovieGrid() {
    return GridView.builder(
      itemCount: _movies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, i) {
        return _buildMovieItem(_movies[i]);
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
              )
            ),
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
        child: _buildMovieGrid()
      ),
    );
  }
}
