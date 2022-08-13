import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/device_size.dart';

class CustomDrawer extends StatefulWidget {

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String categories = 'All';
  bool isDisplayingCategory = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: AssetImage('assets/todo_Lists.jpg')),
          SizedBox(
            height: displayHeight(context) * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('Star Tasks',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.widgets, color: Colors.teal),
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                        ),

                        Text('Category',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    IconButton(onPressed: () {
                      setState((){
                        isDisplayingCategory=!isDisplayingCategory;
                      });
                    }, icon: Icon(Icons.arrow_drop_down))




                  ],
                ),

                isDisplayingCategory?
                    Container(child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.note_add),

                                SizedBox(
                                  width: displayWidth(context)*0.05,
                                ),

                                Text('All')
                              ],
                            ),

                            SizedBox(
                              height: displayHeight(context)*0.013,
                            ),

                            Row(
                              children: [
                                Icon(Icons.note_add),

                                SizedBox(
                                  width: displayWidth(context)*0.05,
                                ),

                                Text('Work')
                              ],
                            ),

                            SizedBox(
                              height: displayHeight(context)*0.013,
                            ),

                            Row(
                              children: [
                                Icon(Icons.note_add),

                                SizedBox(
                                  width: displayWidth(context)*0.05,
                                ),

                                Text('Personal')
                              ],
                            ),

                            SizedBox(
                              height: displayHeight(context)*0.013,
                            ),

                            Row(
                              children: [
                                Icon(Icons.note_add),

                                SizedBox(
                                  width: displayWidth(context)*0.05,
                                ),

                                Text('Wishlist')
                              ],
                            ),

                            SizedBox(
                              height: displayHeight(context)*0.013,
                            ),

                            Row(
                              children: [
                                Icon(Icons.note_add),

                                SizedBox(
                                  width: displayWidth(context)*0.05,
                                ),

                                Text('Birthday')
                              ],
                            ),

                          ],
                        ),
                    ),
                    )
                    : SizedBox(),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  children: [
                    Icon(Icons.format_paint, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('Theme',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  children: [
                    Icon(Icons.display_settings, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('Widget',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  children: [
                    Icon(Icons.monitor_heart, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('Donate',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  children: [
                    Icon(Icons.feedback, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('Feedback',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.04,
                ),
                Row(
                  children: [
                    Icon(Icons.question_mark_rounded, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.05,
                    ),

                    Text('FAQ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                Row(
                  children: [
                    Icon(Icons.settings, color: Colors.teal),
                    SizedBox(
                      width: displayWidth(context) * 0.04,
                    ),

                    Text('Settings',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}

