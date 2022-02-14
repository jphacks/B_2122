import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  bool favorite = false;

  void changeColor() {
    if (favorite) {
      favorite = false;
    } else {
      favorite = true;
    }
    notifyListeners();
  }
}