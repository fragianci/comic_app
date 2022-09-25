import 'package:comic_app/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ButtonFavourite extends StatelessWidget {
  ButtonFavourite();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            addToFavorite(context);
          },
          // => context.read<Wishlist>().incrementCounter(),
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 25.0,
          ),
        ));
  }
}

void addToFavorite(BuildContext context) {
  print('adding to favorite');
  final provider = context.read<Wishlist>();
  provider.incrementCounter();
}
