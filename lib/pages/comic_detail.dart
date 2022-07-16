import 'package:comic_app/model/comics_data.dart';
import 'package:comic_app/widgets/comic_detail_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicDetail extends StatefulWidget {
  dynamic comicDetail;
  bool hasSynopsis;
  ComicsData currentGenre;
  ComicDetail(this.comicDetail, this.hasSynopsis, this.currentGenre);
  @override
  State<ComicDetail> createState() => _ComicDetailState(comicDetail, hasSynopsis, currentGenre);
}

class _ComicDetailState extends State<ComicDetail> with SingleTickerProviderStateMixin{
  dynamic comicDetail;
  bool hasSynopsis;
  ComicsData currentGenre;
  late Animation<double> animation;
  late AnimationController controller;

  _ComicDetailState(this.comicDetail, this.hasSynopsis, this.currentGenre);

  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 3000).animate(controller)
      ..addListener(() {
        setState(() {
          print('animation');
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          child: ComicDetailAppBar(currentGenre),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              comicImage(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20),              
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          comicDetail.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                      ),
                      currentGenre.genre == 'All'
                      ? Container(
                        margin: EdgeInsets.only(right: 20),
                        child: const Text(
                          'Genre: All',
                          style: TextStyle(fontSize: 17),
                        )
                      )
                      : getGenres(),
                    ],
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: TextButton(
                        onPressed: (){
                          launch(Uri.parse(comicDetail.url));
                        },
                        child: const Text('Link to My anime list'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0)
                        ),
                      )
                    ),
                    buttonFavourite(),
                  ]
                ),
              ),
              if (hasSynopsis) 
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: animation.value,
                  // width: animation.value,
                  child: Text(
                    'Synopsis: \n'
                    '${comicDetail.synopsis}'
                  ),
                )
              else Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('No synopsis'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container getGenres() {
    return Container(
      margin: EdgeInsets.only(right: 0),
      child: Row(
        children: [
          const Text(
            'Genres: ',
            style: TextStyle(fontSize: 13),
          ),
          for(int i=0; i<3; i++)
            Text(
              '${comicDetail.genres[i].name}, ',
              style: TextStyle(fontSize: 13),
            ),
        ],
      ),
    );
  }

  Align comicImage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              width: animation.value,
              height: 220,
              child: Image.network(
                comicDetail.imageUrl,
                fit: BoxFit.cover,
                alignment: AlignmentGeometry.lerp(Alignment.topCenter, Alignment.center, 0.5)!,
              ),
            )
        )
      ),
    );
  }

  Container buttonFavourite() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 255, 149, 100),
            Color.fromARGB(255, 247, 103, 103),
          ],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(0, 0),
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          elevation: 0,
        ),
        onPressed: (){
          addToFavorite();
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
          size: 25.0,
        )
      ),
    );
  }

  void launch(Uri url) async{
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  void addToFavorite(){
    print('adding to favorite');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
