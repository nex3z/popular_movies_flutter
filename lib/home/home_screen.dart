import 'package:flutter/material.dart';
import 'package:popular_movies_flutter/discover/discover_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Popular Movies'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Discover'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Favourite'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: DiscoverScreen(),
    );
  }
}
