import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/home/home_screen.dart';

void main() => runApp(PopularMovies());

class PopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
