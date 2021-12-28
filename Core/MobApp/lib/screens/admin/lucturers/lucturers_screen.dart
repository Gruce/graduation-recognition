import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_teachers_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';

import '../layout.dart';
import 'lucturer_widget.dart';
import 'search_widget.dart';

class AdminLucurersScreen extends GetView {
  AdminLucurersScreen({Key? key}) : super(key: key);

  @override
  AdminLucurersController controller = Get.put(AdminLucurersController());

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Lucturers',
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
              child: GetBuilder<AdminLucurersController>(
                  builder: (_) => controller.filteredTeachers.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filteredTeachers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => Get.toNamed(Routes.personProfile,
                                    arguments:
                                        controller.filteredTeachers[index].id),
                                child: TeacherWidget(
                                    key: ObjectKey(
                                        controller.filteredTeachers[index].id),
                                    name: controller.filteredTeachers[index].user.name,
                                    type: 2,
                                    camera:"camera",
                                    //  controller.filteredPeople[index].trackings.camera.description,
                                    time:"time",
                                    sectionName:controller.filteredTeachers[index].section.name,
                                    // controller.filteredPeople[index].trackings.seen,
                                    speciality: controller.filteredTeachers[index].speciality
                                    )
                                  );
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
