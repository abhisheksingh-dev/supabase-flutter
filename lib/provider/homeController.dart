import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  int index = 0;

  navigateToScreen({required int i}) {
    index = i;
    notifyListeners();
  }
}
