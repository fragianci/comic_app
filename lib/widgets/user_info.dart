import 'package:comic_app/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          height: 80,
          width: 80,
          child: UserImage(),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: const Text(
            'Villain of the movie "Seven"',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15
            ),
          ),
        )
      ],
    );
  }
}