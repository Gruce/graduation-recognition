import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';
import 'package:graduaiton_app/screens/general/people/attendance_controller.dart';
import 'package:intl/intl.dart';

class Attendance extends GetWidget {
  @override
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
                                                      Row(children: const [
                                                        Text('Hassan Hazim'),
                                                      ]),
                                                      Container(
                                                        height: 20,
                                                        width: 78,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFFBAF3D2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Present',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.6)),
                                                          ),
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
