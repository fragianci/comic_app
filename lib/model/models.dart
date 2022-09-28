import 'package:flutter/material.dart';

class ButtonSettingsData {
  String title;
  String label;
  IconData icon;

  ButtonSettingsData(
      {required this.title, required this.label, required this.icon});
}

class ComicsData {
  final String genre;
  final int genreId;
  bool isActive;

  ComicsData(
      {required this.genre, required this.isActive, required this.genreId});
}

class WishlistComic {
  int id;
  String title;

  WishlistComic({required this.id, required this.title});
}
