import 'package:comic_app/model/models.dart';
import 'package:flutter/material.dart';

class Wishlist extends ChangeNotifier {
  List<WishlistComic> wishlist = [];

  List<WishlistComic> getWishlist() {
    return wishlist;
  }

  void addToWishlist(wishlistComic) {
    print(wishlist.length);
    if (wishlist.length > 0) {
      // final prova =
      // wishlist.firstWhere((comic) => comic.id == wishlistComic.id);
      int finder = -1;
      // print(finder);
      for (int i = 0; i < wishlist.length; i++) {
        if (wishlistComic.id != wishlist[i].id) {
          if (i == wishlist.length - 1 && finder == -1) {
            wishlist.add(wishlistComic);
          }
        } else {
          finder = -1;
        }
      }
    } else {
      wishlist.add(wishlistComic);
    }
    for (int i = 0; i < wishlist.length; i++) {
      print(wishlist[i].title);
    }
    notifyListeners();
  }

  void deleteWishlist() {
    wishlist = [];
    print(wishlist);
    notifyListeners();
  }
}
