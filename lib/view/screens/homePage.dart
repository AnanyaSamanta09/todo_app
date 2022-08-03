import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/Screen_list.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/screen_controller.dart';
import 'package:todo_app/model/tasks_model.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/view/common/categoryBar.dart';
import 'package:todo_app/view/common/drawer.dart';
import 'package:uuid/uuid.dart';

import '../../constants/device_size.dart';

class HomePage extends StatelessWidget {
  int selectedIndex = 0;
  String page = 'Grey';
  TextEditingController taskController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    final dataController = Provider.of<TasksProvider>(context);

    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        drawer: Drawer(
          child: CustomDrawer(),
        ),
        body: screens[controller.index],
        bottomNavigationBar: PandaBar(
          fabColors: [primaryColor, LightColor],
          buttonColor: Colors.grey,
          buttonSelectedColor: LightColor,
          backgroundColor: Colors.black,
          onFabButtonPressed: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                        top: 10,
                        right: 10,
                        left: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            controller: taskController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 10),
                              hintText: 'Input new task here',
                              hintStyle: TextStyle(
                                fontSize: 20,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: displayHeight(context) * 0.064,
                                    width: displayWidth(context) * 0.25,
                                    //color: Colors.blueGrey,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey.shade300),
                                    child: Center(
                                        child: Text(
                                      'No Category',
                                    )),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.04,
                                  ),
                                  Icon(Icons.calendar_month)
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      dataController.addTask(
                                        TasksModel(id: uuid.v1(), taskName: taskController.text, dueDate: DateTime.now(), isFavourite: false, isComplete: false)
                                      );
                                      taskController.clear();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.assistant_navigation,
                                    color: Colors.grey,
                                    size: 52,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          onChange: (selectedPage) {
            print(selectedPage.toString());
            if (selectedPage == 0) {
              _scaffoldState.currentState!.openDrawer();
            } else {
              controller.changeScreen(selectedPage);
            }
          },
          buttonData: [
            PandaBarButtonData(
              id: 0,
              icon: Icons.menu,
            ),
            PandaBarButtonData(
              id: 1,
              icon: Icons.task,
              title: 'Tasks',
            ),
            PandaBarButtonData(
              id: 2,
              icon: Icons.calendar_month,
              title: 'Calendar',
            ),
            PandaBarButtonData(
              id: 3,
              icon: Icons.person_sharp,
              title: 'Mine',
            ),
          ],
        ),
      ),
    );
  }
}
