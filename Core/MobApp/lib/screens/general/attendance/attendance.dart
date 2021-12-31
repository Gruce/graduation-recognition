import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';
import 'package:graduaiton_app/screens/general/attendance/toggle_button.dart';

import 'package:intl/intl.dart';

class Attendance extends GetWidget {
  @override
  int _toggleValue = 0;
  TeacherStudentsUnitController controller =
      Get.put(TeacherStudentsUnitController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    ),
                    const Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: GetBuilder<TeacherStudentsUnitController>(
                      builder: (_) => ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              // onTap: () => Get.to(() => StudentsProfileWidget(),
                              // arguments: controller.students[index].id),
                              child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color.fromRGBO(249, 249, 249, 1),
                                        width: 0.6),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          ListTile(
                                              title: Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      
                                                        Text('Hassan Hazim'),
                                                        Container(
                                                          height: 20,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFBAF3D2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                          child: AnimatedToggle(
                                                            values: [
                                                              'Present',
                                                              'Absent'
                                                            ],
                                                            onToggleCallback:
                                                                (value) {
                                                              // setState(() {
                                                              //   _toggleValue =
                                                              //       value;
                                                              // });
                                                            },
                                                            buttonColor:
                                                                const Color(
                                                                    0xFF0A3157),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFFB5C1CC),
                                                            textColor:
                                                                const Color(
                                                                    0xFFFFFFFF),
                                                          ),
                                                        ),
                                                      
                                                    ],
                                                  )),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    'f',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  )),
                                                  Container(
                                                      height: 20,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromRGBO(
                                                            243, 243, 243, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.0),
                                                      ),
                                                      child: Row(
                                                        children: const [
                                                          Text(
                                                            ' Absences : ',
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          Center(
                                                              child: Text('0'))
                                                        ],
                                                      )),
                                                ],
                                              )),
                                        ],
                                      ))),
                            );
                          })))
            ],
          )),
    );
  }
}
