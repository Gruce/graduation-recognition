import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/students/student_widget.dart';
import 'package:graduaiton_app/screens/admin/students/students_search_widget.dart';
import '../layout.dart';
import 'student_dropdown_widget.dart';

class AdminStudentsScreen extends GetView {
  AdminStudentsScreen({Key? key}) : super(key: key);

  @override
  AdminStudentsController controller = Get.put(AdminStudentsController());

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Students',
        child: Container(
            margin: const EdgeInsets.all(15),
            child: Obx(() => Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () => controller.searchToggle.value =
                                  !controller.searchToggle.value,
                              color: controller.searchToggle.value
                                  ? const Color(0xff6875F5)
                                  : Colors.black54),
                          IconButton(
                              icon: const Icon(Icons.filter_alt),
                              onPressed: () => controller.filterToggle.value =
                                  !controller.filterToggle.value,
                              color: controller.filterToggle.value
                                  ? const Color(0xff6875F5)
                                  : Colors.black54)
                        ]),
                    // Search Container
                    controller.searchToggle.value
                        ? StudentsSearchWidget()
                        : Container(),
                    const SizedBox(height: 10),
                    controller.filterToggle.value
                        ? StudentsDropDownWidget()
                        : Container(),
                    // DropDownWidget(),
                    const SizedBox(height: 10),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(255, 255, 255, .5)),
                      child: GetBuilder<AdminStudentsController>(
                          builder: (_) => controller.filteredStudents.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller.filteredStudents.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () => Get.toNamed(
                                            Routes.personProfile,
                                            arguments: controller
                                                .filteredStudents[index].id),
                                        child: StudentWidget(
                                          key: ObjectKey(controller
                                              .filteredStudents[index].id),
                                          name: controller
                                              .filteredStudents[index]
                                              .user
                                              .name,
                                          section_name: controller
                                              .filteredStudents[index]
                                              .section
                                              .name,
                                          stage_name: controller
                                              .filteredStudents[index]
                                              .stage
                                              .name,
                                          unit_name: controller
                                              .filteredStudents[index]
                                              .unit
                                              .name,
                                          camera: controller
                                                  .filteredStudents[index]
                                                  .user
                                                  .trackings
                                                  .isNotEmpty
                                              ? controller
                                                  .filteredStudents[index]
                                                  .user
                                                  .trackings[0]
                                                  .camera
                                                  .description
                                              : "No Camera",
                                          time: controller
                                                  .filteredStudents[index]
                                                  .user
                                                  .trackings
                                                  .isNotEmpty
                                              ? controller
                                                  .filteredStudents[index]
                                                  .user
                                                  .trackings[0]
                                                  .created_at
                                              : "No Time",
                                          user_id: controller
                                              .filteredStudents[index].user_id,
                                        ));
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
                ))));
  }
}
