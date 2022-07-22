import 'package:flutter/material.dart';

class TaskPageController extends ChangeNotifier{
  int index=0;
  void changeIndex(int currentIndex){
    index = currentIndex;
    notifyListeners();
  }
}