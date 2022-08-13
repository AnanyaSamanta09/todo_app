import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';

import '../../constants/device_size.dart';
import '../../controllers/dateTime.dart';
import '../../model/tasks_model.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<TasksModel> displayList = [];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TasksProvider>(context);

    final DtimeController = Provider.of<DatetimeController> (context);

    final taskController = Provider.of<TasksProvider>(context);

    cardBox(TasksModel task) {
      int indexInOriginalList = taskController.getTaskIndexById(task.id);
      return Container(
        height: displayHeight(context) * 0.1,
        width: displayWidth(context),
        color: Colors.blue.shade100.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){

                  taskController.completeTask(indexInOriginalList);
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
                          (taskController.taskList[indexInOriginalList].isComplete)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ],
        ),
      );
    }



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              onChanged: (query) {
                if (query.isEmpty) {
                  displayList = [];
                } else {
                  displayList = controller.taskList
                      .where((element) => element.taskName.toLowerCase().startsWith(query.toLowerCase()))
                      .toList();
                  print(displayList.length);
                }
                setState(() {});
              },
              // controller: query,
              decoration: InputDecoration(
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
                  hintText: 'Search'),
            ),
          ),
        ),
        body: (displayList.isEmpty)
            ? const Center(
                child: Text("No results found",
                  style: TextStyle(
                    fontSize: 15
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20),


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
                                                taskController.removeTask(displayList[index].id);
                                                displayList.removeAt(index);
                                                setState((){});
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
                        child: Column(
                          children: [
                            cardBox(displayList[index]),

                            Text(
                              DtimeController.selectedDate.toString(),
                            ),
                          ],
                        )
                    ),



                  );



                },
                itemCount: displayList.length,
              ),
      ),
    );
  }
}
