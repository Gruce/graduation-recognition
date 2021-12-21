import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/students_unit_controller.dart';
import 'package:graduaiton_app/screens/teacher/units/search.dart';



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
        title: 'Students',
        child: Column(children: [
          StudentSearchWidget(),
          // const Text("data"),
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
                                                            .filteredStudent[index]
                                                            .user
                                                            .name),
                                                      ]),
                                                      Text(controller
                                                          .filteredStudent[index]
                                                          .stage.name),
                                                    ],
                                                  )),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(child: Text(
                                                    controller
                                                        .filteredStudent[index].user.email
                                                    ,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  )),
                                                  Text(
                                                    controller
                                                            .filteredStudent[index].section.name,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),

                                                  
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
                                  style: TextStyle(fontSize: 24)
                                  )
                                  )
                                  )
                                  )
                                  )
        ]));
  }
}
