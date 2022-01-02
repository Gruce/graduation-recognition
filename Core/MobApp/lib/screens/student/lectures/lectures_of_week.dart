import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_lectures_controller.dart';
import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';
import 'package:graduaiton_app/screens/general/luctures/lecture_days_filter_widget.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/screens/student/layout.dart';

import 'lecture_days_filter_widget.dart';

class LecturesWeekScreen extends GetView {
  LecturesWeekScreen({Key? key}) : super(key: key);
  @override
  StudentLecturesController controller1 = Get.put(StudentLecturesController());
  
  @override
  Widget build(BuildContext context) {
    return StudentLayoutScreen(
        title: 'Lectures of the Week',
        child: Column(
          children: [
            DaysFilterWidget(),
            Container(
              child: Expanded(
                  child: Container(
                      // padding:
                      // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(255, 255, 255, .5),
                      ),
                      child: Expanded(
                          child: GetBuilder<StudentLecturesController>(
                              builder: (_) => controller1
                                      .lecturesWeek.isNotEmpty
                                  ? ListView.builder(
                                      itemCount:
                                          controller1.lecturesWeek.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            elevation: 0,
                                            // shadowColor: Colors.black12,
                                            color: Colors.transparent,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 23.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.93,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(controller1
                                                          .lecturesWeek[index]
                                                          .day
                                                          .name
                                                          .toString()),
                                                      Text(controller1
                                                          .lecturesWeek[index]
                                                          .subject
                                                          .name
                                                          .toString()),
                                                      Text(controller1
                                                          .lecturesWeek[index]
                                                          .start
                                                          .toString())
                                                    ],
                                                  ),
                                                ),
                                                ListTile(
                                                    title: Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(children: [
                                                              Text(controller1
                                                                  .lecturesWeek[
                                                                      index]
                                                                  .teacher
                                                                  .user
                                                                  .name
                                                                  .toString()),
                                                            ]),
                                                          ],
                                                        )),
                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'classroom: ' +
                                                              controller1
                                                                  .lecturesWeek[
                                                                      index]
                                                                  .classroom
                                                                  .name
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6)),
                                                        ),
                                                      ],
                                                    )),
                                                Divider(
                                                  thickness: 0.3,
                                                ),
                                              ],
                                            ));
                                      },
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: const Text('Not Found',
                                              style: TextStyle(
                                                  fontSize: 24))
                                                  )
                                                  ))
                                                  )
                                                  )),
            )
          ],
        ));
  }
}
