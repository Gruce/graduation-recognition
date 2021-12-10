import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_units_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/teacher/units/student_units_screen.dart';

import '../layout.dart';

class TeacherUnitsScreen extends GetView {
  TeacherUnitsScreen({Key? key}) : super(key: key);

  @override
  TeacherUnitsController controller = Get.put(TeacherUnitsController());

  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Units',
        child: Column(children: [
          Expanded(
              child: GetBuilder<TeacherUnitsController>(
                  builder: (_) => controller.units.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.units.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Get.to(() => StudentsUnitsScreen(),
                                  arguments: controller.units[index].id),
                              child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color:
                                            controller.units[index].name == 'A'
                                                ? Color(0xffd4d8ff)
                                                : Color(0xffFBEDEE),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
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
                                                      Row(children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(7.5),
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: controller
                                                                        .units[
                                                                            index]
                                                                        .name ==
                                                                    'A'
                                                                ? Color(
                                                                    0xff6875F5)
                                                                : Color(
                                                                    0xffDEBEC0),
                                                          ),
                                                          child: Text(
                                                            controller
                                                                .units[index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                        Text(controller
                                                            .units[index]
                                                            .section
                                                            .name),
                                                      ]),
                                                      const Text(
                                                          'Subject Title'),
                                                    ],
                                                  )),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    controller.units[index]
                                                        .students_count
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                  Text(
                                                    '1 Hour to begin',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),

                                                  // Container(
                                                  //   padding: const EdgeInsets.all(5),
                                                  //   margin: const EdgeInsets.only(right: 5),
                                                  //   decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  //     color: const Color(0xffcccccc),
                                                  //   ),
                                                  //   child: Icon(Icons.arrow_right_alt_rounded),
                                                  // ),
                                                ],
                                              )),
                                        ],
                                      ))),
                            );
                          })
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))))))
        ]));
  }
}
