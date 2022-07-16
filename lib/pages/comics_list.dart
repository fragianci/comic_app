import 'package:comic_app/model/comics_data.dart';
import 'package:comic_app/widgets/chip.dart';
import 'package:comic_app/pages/comic_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jikan_api/jikan_api.dart';

class ComicsList extends StatefulWidget {
  // final List<ComicsListData> comics;
  ComicsList();
  @override
  State<ComicsList> createState() {
    return ComicsListState();
  }
}

class ComicsListState extends State<ComicsList> {
  Jikan jikan = Jikan();
  Dio dio = Dio();

  ComicsListState();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 10),
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: jikan.getTop(TopType.manga),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  List<Top> comicsList = snapshot.data.toList();
                  // print(comicsList[0]);
                  return ListView.builder(
                    itemBuilder: (context, index) => 
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.all(0),
                              ),
                              onPressed: (){
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => 
                                      ComicDetail(
                                        comicsList[index], 
                                        false,
                                        ComicsData(genre: 'All', isActive: false, genreId: 5)
                                      )
                                  )
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Stack(
                                    fit: StackFit.passthrough,
                                    children: [
                                      Image.network(
                                        comicsList[index].imageUrl,
                                        fit: BoxFit.cover,
                                        alignment: AlignmentGeometry.lerp(Alignment.topCenter, Alignment.center, 0.5)!,
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: const EdgeInsets.only(bottom: 9, left: 15),
                                        child: ChipWidget('Rank', comicsList[index].rank)
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: const EdgeInsets.only(top: 9, right: 15),
                                        child: ChipWidget('Score', comicsList[index].score)
                                      ),
                                    ]
                                  ),  
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      comicsList[index].title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: comicsList.length,
                  );
          
                }
                else{
                  return Center(child: const CircularProgressIndicator());
                }
              }
            ),
          ),
          // for(var comic in comics)
        ],
      ),
    );
  }
}