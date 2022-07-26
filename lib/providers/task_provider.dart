import 'package:flutter/material.dart';

import '../model/tasks_model.dart';

class TasksProvider extends ChangeNotifier{
  List<TasksModel> taskList= [];
  void addTask(TasksModel task){
    taskList.add(task);
    notifyListeners();
  }
  void removeTask(String id){
    int index = taskList.indexWhere((element) => element.id==id);
    taskList.removeAt(index);
    notifyListeners();
  }
  int getTaskIndexById(String id){
    int index = taskList.indexWhere((element) => element.id==id);
    return index;
  }



  void completeTask(int index){
     taskList[index].completeTask();
     notifyListeners();
  }

  void changeDate(String id,DateTime newDate){
    int index = taskList.indexWhere((element) => element.id ==id);
    taskList[index].changeDate(newDate);
    notifyListeners();
  }
}