import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier{
  int index = 1;
  void changeScreen(int newindex){
    index = newindex;
    notifyListeners();
  }
}