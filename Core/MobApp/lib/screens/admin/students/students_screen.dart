import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';

import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/people/search_widget.dart';

import '../layout.dart';
import 'student_widget.dart';

class AdminStudentsScreen extends GetView<AdminStudentsController> {
  const AdminStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Student',
        child: Column(
          children: [
            // Search Container
            SearchWidget(),
            const SizedBox(height: 10),

            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(255, 255, 255, .5)),
              child: GetBuilder<AdminStudentsController>(
                  builder: (_) => controller.filteredStudents.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filteredStudents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => Get.toNamed(Routes.personProfile,
                                    arguments:
                                        controller.filteredStudents[index].id),
                                child: StudentWidget(
                                    key: ObjectKey(
                                        controller.filteredStudents[index].id),
                                    name: controller.filteredStudents[index].name,
                                    type: controller.filteredStudents[index].type,
                                    camera: "Camera",
                                    time: "Time"));
                          },
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))))),
            ))
          ],
        ));
  }
}
