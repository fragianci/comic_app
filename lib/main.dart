import 'package:comic_app/model/comics_data.dart';
import 'package:comic_app/pages/home.dart';
import 'package:comic_app/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Wishlist())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ComicsData currentGenre =
      ComicsData(genre: 'All', isActive: false, genreId: 5);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic app',
      home: Home(currentGenre),
    );
  }
}
