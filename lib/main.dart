import 'package:comic_app/model/comics_data.dart';
import 'package:comic_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ComicsData currentGenre = ComicsData(genre: 'All', isActive: false, genreId: 5);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic app',
      home: Home(currentGenre),
    );
  }
}
