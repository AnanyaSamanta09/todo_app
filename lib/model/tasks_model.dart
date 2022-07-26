import 'package:flutter/material.dart';

class TasksModel{
  final String id;
  final String taskName;
  DateTime dueDate;
  bool isFavourite = false;
  bool isComplete = false;

  TasksModel({
    required this.id,
    required this.taskName,
    required this.dueDate,
    required this.isFavourite,
    required this.isComplete
});

  void completeTask(){
    isComplete=!isComplete;
  }

  void changeDate(DateTime updatedDate){
    dueDate = updatedDate;
  }
}