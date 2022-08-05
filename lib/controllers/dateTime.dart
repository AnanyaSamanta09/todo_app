import 'package:flutter/material.dart';

class DatetimeController extends ChangeNotifier{
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }
}