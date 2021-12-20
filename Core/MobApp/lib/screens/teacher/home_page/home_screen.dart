import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/circular_progress.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../layout.dart';

class TeacherHomeScreen extends GetView {
  TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  TeacherHomeController controller = Get.put(TeacherHomeController());

  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Home',
        child: Column(
          children: [
            Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.93,
                          decoration: BoxDecoration(
                            color: const Color(0xffC1C1C1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Next Lucter'),
                              Text('PHP'),
                              Text('Time : 10 AM')
                            ],
                          ),
                        ),
                        ListTile(
                            title: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Text('Stage : Forth'),
                                    ]),
                                    Text('Unit: A'),
                                  ],
                                )),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  's',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )),
                                Text(
                                  'd',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            )),
                      ],
                    ))),
            Text("Not started"),
            MyButton(label: "Start Lecture", onTap: controller.startLecture)
          ],
        ));
  }
}
