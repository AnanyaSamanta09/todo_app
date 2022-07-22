import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/categoryData.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/controllers/taskPage_controller.dart';

import '../../constants/device_size.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskPageController>(context);
    return Container(
      height: displayHeight(context)*0.08,
      width: displayWidth(context),
      padding: EdgeInsets.all(5),
     // color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: Colors.red,
            width: displayWidth(context)*0.85,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      controller.changeIndex(index);
                    },
                    child: Card(
                      color: controller.index==index ? Colors.teal.shade500 : SeaColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Center(
                          child: Text(
                              cardlist[index].text,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              itemCount: cardlist.length,
            ),

          ),
          PopupMenuButton(onSelected: (value){
            print(value);
          },
              color: Colors.blueGrey.shade100,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              itemBuilder:(BuildContext context){
            return [
              PopupMenuItem(child: ListTile(
                leading: Text('Manage Categories',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              )
              ),
              PopupMenuItem(child: ListTile(
                leading: Text('Search',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              )
              ),
              PopupMenuItem(child: ListTile(
                leading: Text('Sort by',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              )
              ),
              PopupMenuItem(child: ListTile(
                leading: Text('Print',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              )
              ),

            ];
              }
          )
        ],
      ),
    );
  }
}
