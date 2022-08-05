import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/view/common/displayTask.dart';

import '../../constants/device_size.dart';
import '../common/categoryBar.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TasksProvider>(context);
    return Scaffold(
      body:Column(
        children: [
          CategoryBar(),

          //Center(child: Image(image: AssetImage('assets/todo_list.jpg'))),
          Expanded(child: Displaytask())
          ],
      )
    );
  }
}
