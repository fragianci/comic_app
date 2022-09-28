import 'package:comic_app/model/models.dart';
import 'package:comic_app/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ButtonFavourite extends StatefulWidget {
  dynamic comicDetail;
  ButtonFavourite(this.comicDetail);
  State<ButtonFavourite> createState() => ButtonFavouriteState(comicDetail);
}

class ButtonFavouriteState extends State<ButtonFavourite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  dynamic comicDetail;
  bool buttonFavoriteClicked = false;
  ButtonFavouriteState(this.comicDetail);

  @override
  Widget build(BuildContext context) {
    return !buttonFavoriteClicked
        ? Container(
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
                addToFavorite(context, this.comicDetail);
              },
              // => context.read<Wishlist>().incrementCounter(),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25.0,
              ),
            ))
        : Container(
            margin: EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                color: Color.fromARGB(255, 158, 141, 141)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: Size(0, 0),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                elevation: 0,
              ),
              onPressed: () {
                setState(() {
                  buttonFavoriteClicked = !buttonFavoriteClicked;
                });
              },
              // => context.read<Wishlist>().incrementCounter(),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25.0,
              ),
            ));
  }

  void addToFavorite(BuildContext context, comicDetail) {
    setState(() {
      buttonFavoriteClicked = !buttonFavoriteClicked;
      final wishlistComic =
          WishlistComic(id: comicDetail.malId, title: comicDetail.title);
      final provider = context.read<Wishlist>();
      provider.addToWishlist(wishlistComic);
      // provider.deleteWishlist();
    });
  }
}
