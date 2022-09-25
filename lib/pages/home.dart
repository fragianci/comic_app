import 'package:comic_app/model/comics_data.dart';
import 'package:comic_app/pages/comics_by_genre.dart';
import 'package:comic_app/pages/comics_list.dart';
import 'package:comic_app/pages/my_profile.dart';
import 'package:comic_app/widgets/home_header.dart';
import 'package:comic_app/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';

class Home extends StatefulWidget {
  ComicsData currentGenre;
  @override
  Home(this.currentGenre);
  State<Home> createState() {
    return HomeState(currentGenre);
  }
}

class HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool userImageClicked = false;
  ComicsData currentGenre;
  final List<ComicsData> comics = [
    ComicsData(genre: 'All', isActive: true, genreId: 5),
    ComicsData(genre: 'Action', isActive: false, genreId: 1),
    ComicsData(genre: 'Horror', isActive: false, genreId: 14),
    ComicsData(genre: 'Fantasy', isActive: false, genreId: 10)
  ];
  HomeState(this.currentGenre);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !userImageClicked
          ? Column(
              children: [
                Header(switchHomeAndProfile),
                NavBar(changeGenre, comics, currentGenre),
                currentGenre.genre == 'All'
                    ? Expanded(child: ComicsList())
                    : ComicsByGenre(currentGenre),
              ],
            )
          : MyProfile(switchHomeAndProfile),
    );
  }

  void switchHomeAndProfile() {
    setState(() {
      userImageClicked = !userImageClicked;
    });
  }

  void changeGenre(myComic) async {
    setState(() {
      for (var comic in comics) {
        if (comic.isActive) {
          comic.isActive = false;
        }
      }
      if (!myComic.isActive) {
        myComic.isActive = true;
        currentGenre = myComic;
      }
      Jikan jikan = Jikan();
      jikan.getMangaPictures(0);
    });
  }
}
