import 'package:flutter/cupertino.dart';


class TopModel extends ChangeNotifier {

  int currentIndex = 0;

  void onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}