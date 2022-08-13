import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/device_size.dart';
import 'package:todo_app/model/tasks_model.dart';

import '../../controllers/dateTime.dart';
import '../../providers/task_provider.dart';

class Displaytask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TasksProvider>(context);
    

    cardBox(TasksModel task, int index) {
      return Container(
        height: displayHeight(context) * 0.1,
        width: displayWidth(context),
        color: Colors.blue.shade100.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){

                      taskController.completeTask(index);
                    },
                        icon: Icon(task.isComplete? Icons.check_box : Icons.check_box_outline_blank)
                    ),

                    Container(
                        width: displayWidth(context) * 0.5,
                        child: Text(
                          task.taskName,
                          style: TextStyle(
                              fontSize: 17,
                              decoration:
                                  (taskController.taskList[index].isComplete)
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                  task.dueDate.toString().substring(0,10),
              ),
            ),
          ],
        ),
      );
    }

    return (taskController.taskList.isEmpty)?
        Image.asset('assets/todo_list.jpg')
        :ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 4, left: 25, right: 25),
            child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 1 / 1.5,
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      onPressed: (context) {},
                      backgroundColor: Colors.blueGrey.shade200,
                      foregroundColor: Colors.white,
                      icon: Icons.star_border_outlined,
                      label: 'Star',
                    ),
                    SlidableAction(
                      onPressed: (context) async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),);
                        taskController.changeDate(taskController.taskList[index].id,selectedDate!);
                      },
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      icon: Icons.date_range,
                      label: 'Date',
                    ),
                    SlidableAction(
                      // An action can be bigger than the others.
                      onPressed: (context) {
                        // removeController.removeTask(index);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Delete',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text(
                                  'Delete Task ?',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel')),
                                  TextButton(
                                      onPressed: () {
                                        taskController.removeTask(taskController.taskList[index].id);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Delete'))
                                ],
                              );
                            });
                      },
                      backgroundColor: Colors.red.shade300,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: cardBox(taskController.taskList[index],index,)
            ),
        );
      },
      itemCount: taskController.taskList.length,
    );
  }
}
