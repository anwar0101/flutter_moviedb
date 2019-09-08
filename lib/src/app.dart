import 'package:flutter/material.dart';
import 'package:flutter_moviedb/src/ui/movie_details.dart';
import 'ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => MovieList(),
        '/details': (context) => MovieDetails()
      },
    );
  }
}
