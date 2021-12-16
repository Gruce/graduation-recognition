import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';



import '../layout.dart';

class StudentsUnitsScreen extends GetView {
  StudentsUnitsScreen({Key? key}) : super(key: key);

  @override
  TeacherStudentsUnitController controller =
      Get.put(TeacherStudentsUnitController());

  @override
  Widget build(BuildContext context) {
    controller.fetch(Get.arguments);
    return TeacherLayoutScreen(
        title: 'Student',
        child: Column(children: [
          // const Text("data"),
          Expanded(
              child: GetBuilder<TeacherStudentsUnitController>(
                  builder: (_) => controller.students.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.students.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                // onTap: () => Get.to(() => StudentsProfileWidget(),
                                  // arguments: controller.students[index].id),
                              child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd4d8ff),
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
                                                        Text(controller
                                                            .students[index]
                                                            .user
                                                            .name),
                                                      ]),
                                                      Text(controller
                                                          .students[index]
                                                          .stage.name),
                                                    ],
                                                  )),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    controller
                                                            .students[index].user.email
                                                            ,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                  Text(
                                                    controller
                                                            .students[index].section.name,
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