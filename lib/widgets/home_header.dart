import 'package:comic_app/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget {
  final Function() goToMyProfile;

  Header(this.goToMyProfile);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, top: 30),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.white,
                  minimumSize: Size(0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  elevation: 0,
                  shadowColor: Colors.transparent
                ),
                onPressed: (){
                  goToMyProfile();
                },
                child: UserImage(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  children: const [
                    Text(
                      'Good Afternoon',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ),
            ]
          ),
        ]
      )
    );
  }

}