import 'package:flutter/material.dart';

class Wishlist extends ChangeNotifier {
  var count = 0;

  int getCounter() {
    return count;
  }

  void incrementCounter() {
    count++;
    print(count);
    notifyListeners();
  }
}
