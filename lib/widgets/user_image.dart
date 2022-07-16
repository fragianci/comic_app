import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserImage extends StatelessWidget {
  
    
  UserImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), 
          )
        ]
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: Image.asset(
                      'assets/john-doe.jpeg',
                      height: 100,
                      width: 100,
                    ),
            )
        )
      ),
    );
  }
}