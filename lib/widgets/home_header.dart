import 'package:comic_app/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget {
  final Function() goToMyProfile;
  final Function() goToMyLibrary;

  Header(this.goToMyProfile, this.goToMyLibrary);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 22, top: 30),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.white,
                      minimumSize: Size(0, 0),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      elevation: 0,
                      shadowColor: Colors.transparent),
                  onPressed: () => goToMyProfile(),
                  child: UserImage(),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: const [
                        Text(
                          'Good Afternoon',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 12),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ]),
            ),
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Color.fromARGB(255, 234, 62, 62),
                      primary: Color.fromARGB(255, 255, 255, 255),
                      minimumSize: Size(0, 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      elevation: 0,
                      shadowColor: Colors.transparent),
                  onPressed: () => goToMyLibrary(),
                  child: const Text('Library',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ))
          ],
        ));
  }
}
