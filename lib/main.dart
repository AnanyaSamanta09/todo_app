import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/screen_controller.dart';
import 'package:todo_app/view/common/categoryBar.dart';
import 'package:todo_app/view/screens/homePage.dart';

import 'controllers/taskPage_controller.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomePageController()),
        ChangeNotifierProvider(create: (context)=>TaskPageController()),
      ],
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
