import 'package:comic_app/model/models.dart';
import 'package:comic_app/screens/comic_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jikan_api/jikan_api.dart';

// class ComicsByGenre extends StatefulWidget {
//   int genreId;
//   ComicsByGenre(this.genreId);
//   @override
//   State<ComicsByGenre> createState() => _ComicsByGenreState(genreId);
// }

class ComicsByGenre extends StatelessWidget {
  ComicsData currentGenre;
  Jikan jikan = Jikan();

  ComicsByGenre(this.currentGenre);
  @override
  Widget build(BuildContext context) {
    return
        // Text(genreId.toString());
        Container(
      // margin: const EdgeInsets.only(top: 10),
      child: Expanded(
        child: FutureBuilder(
            future: jikan.getGenre(currentGenre.genreId, GenreType.manga),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<MangaItem> comicsByGenre = snapshot.data.manga.toList();
                // print(comicsByGenre[0]);
                return ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComicDetail(
                                      comicsByGenre[index],
                                      true,
                                      currentGenre)));
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                                width: 300,
                                height: 200,
                                child: Image.network(
                                  comicsByGenre[index].imageUrl,
                                  fit: BoxFit.cover,
                                  alignment: AlignmentGeometry.lerp(
                                      Alignment.topCenter,
                                      Alignment.center,
                                      0.5)!,
                                ))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 43),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                comicsByGenre[index].title,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  itemCount: comicsByGenre.length,
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
