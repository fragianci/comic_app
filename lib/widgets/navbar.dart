import 'package:comic_app/model/comics_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavBar extends StatelessWidget {
  final Function(ComicsData) changeGenre;
  final List<ComicsData> comics;
  ComicsData currentGenre;

  NavBar(this.changeGenre, this.comics, this.currentGenre);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 10),
      height: 43,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // verticalDirection: ,
        children: [
          for(var comic in comics)
            comic.genre == currentGenre.genre
            ? Expanded(
                child: 
                  Container(
                    margin: EdgeInsets.only(left: 7, right: 7),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.0, 1.0],
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
                        minimumSize: Size(43, 43),
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onPressed: (){
                        changeGenre(comic);
                      },
                      child: Text(
                        comic.genre,
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                  ),
              )
            : Expanded(
              child: 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: Size(43, 43),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onPressed: (){
                    changeGenre(comic);
                  },
                  child: Text(
                    comic.genre,
                    style: TextStyle(color: Colors.black),
                  )
                ),
            )
        ]
      )
    );
  }
}