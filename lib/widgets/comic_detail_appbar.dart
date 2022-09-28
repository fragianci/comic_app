import 'package:comic_app/model/models.dart';
import 'package:comic_app/pages/home.dart';
import 'package:flutter/material.dart';

class ComicDetailAppBar extends StatelessWidget {
  ComicsData currentGenre;
  ComicDetailAppBar(this.currentGenre);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: EdgeInsets.only(right: 43),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            'Detail Comic',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: alignMethod(context),
      ),
    );
  }

  Align alignMethod(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: Size(0, 0),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            elevation: 0,
          ),
          onPressed: () {
            // changeGenre(currentGenre);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(currentGenre)));
          },
          child: Image.asset(
            'assets/left-arrow-icon.jpeg',
            height: 30,
            width: 30,
          )),
    );
  }
}
