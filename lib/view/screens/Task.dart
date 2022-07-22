import 'package:flutter/material.dart';

import '../../constants/device_size.dart';
import '../common/categoryBar.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CategoryBar(),
          Center(child: Image(image: AssetImage('assets/todo_list.jpg')))
          ],
      )
    );
  }
}
