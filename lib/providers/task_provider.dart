import 'package:flutter/material.dart';

import '../model/tasks_model.dart';

class TasksProvider extends ChangeNotifier{
  List<TasksModel> taskList= [];
  void addTask(TasksModel task){
    taskList.add(task);
    notifyListeners();
  }
  void removeTask(int index){
    taskList.removeAt(index);
    notifyListeners();
  }
  void getTaskById(int id){

  }
  void completeTask(int index){
     taskList[index].completeTask();
     notifyListeners();
  }
}