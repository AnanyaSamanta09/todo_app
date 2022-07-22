import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/Screen_list.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/screen_controller.dart';
import 'package:todo_app/view/common/categoryBar.dart';
import 'package:todo_app/view/common/drawer.dart';

import '../../constants/device_size.dart';

class HomePage extends StatelessWidget {

  int selectedIndex = 0;
  String page = 'Grey';

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        drawer: Drawer(
          child: CustomDrawer(),
        ),

        body: screens[controller.index],

        bottomNavigationBar:  PandaBar(

          fabColors: [primaryColor,LightColor],
          buttonColor: Colors.grey,
          buttonSelectedColor: LightColor,
          backgroundColor: Colors.black,
          onFabButtonPressed: (){

          },
          onChange: (selectedPage) {
            print(selectedPage.toString());
            if(selectedPage==0){
              _scaffoldState.currentState!.openDrawer();
            }
            else{
              controller.changeScreen(selectedPage);
            }
          },
          buttonData: [
            PandaBarButtonData(
              id: 0,
              icon: Icons.menu,
              //title: 'Tasks',
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
