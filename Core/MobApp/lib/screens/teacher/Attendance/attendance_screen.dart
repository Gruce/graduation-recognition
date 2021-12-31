import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_lectures_controller.dart';
import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/attendance_students.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';
import 'package:graduaiton_app/screens/general/attendance/toggle_button.dart';
import 'package:graduaiton_app/screens/student/layout.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';
import 'package:intl/intl.dart';

class TeacherAttendanceScreen extends GetView {
  TeacherAttendanceScreen({Key? key}) : super(key: key);
  @override
  AttendanceStudentsController controller =
      Get.put(AttendanceStudentsController());
  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Lectures of the Week',
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
                    builder: (_) => controller.filteredStudent.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.filteredStudent.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                // onTap: () => Get.to(() => StudentsProfileWidget(),
                                // arguments: controller.students[index].id),
                                child: Card(
                                    elevation: 0,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color:
                                              Color.fromRGBO(249, 249, 249, 1),
                                          width: 0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            ListTile(
                                                title: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(controller
                                                            .filteredStudent[
                                                                index]
                                                            .user
                                                            .name),
                                                        Container(
                                                          height: 20,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFBAF3D2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                          child: AnimatedToggle(
                                                            values: const [
                                                              'Present',
                                                              'Absent'
                                                            ],
                                                            onToggleCallback:
                                                                (value) {
                                                              controller.toggleAbsentStudent(
                                                                  controller
                                                                      .filteredStudent[
                                                                          index]
                                                                      .id,
                                                                  value);
                                                              print(controller
                                                                  .absentStudents);
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
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                    Container(
                                                        height: 20,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              243, 243, 243, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: Row(
                                                          children: const [
                                                            Text(
                                                              ' Absences : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                                child:
                                                                    Text('0'))
                                                          ],
                                                        )),
                                                  ],
                                                )),
                                          ],
                                        ))),
                              );
                            })
                        : Container()))
          ],
        ));
  }
}
