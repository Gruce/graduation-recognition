import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';

import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/people/person_widget.dart';
import 'package:graduaiton_app/screens/admin/students/student_widget.dart';
import 'package:graduaiton_app/screens/admin/students/students_search_widget.dart';
import '../layout.dart';
import 'dropdown_widget/section_dropdown_widget.dart';
import 'dropdown_widget/stage_dropdown_widget.dart';
import 'dropdown_widget/unit_dropdown_widget.dart';

class AdminStudentsScreen extends GetView<AdminStudentsController> {
  const AdminStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Students',
        child: Column(
          children: [
            // Search Container
            StudentsSearchWidget(),
            // DropDownWidget(),
            const SizedBox(height: 20),
            Container(
              width: 300.0,
               decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        border: Border.all(
          color: Colors.white.withOpacity(1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
              // color: Colors.blue[300],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: const [
                    SectionDropDown(),
                    SizedBox(width: 20,),
                    //  SectionDropDown(),
                    StageDropDown(),
                    SizedBox(width: 20,),
                    //  SectionDropDown(),
                    UnitDropDown(),
                  ]),
            ),

            const SizedBox(height: 20),
            // Expanded(
            //     child: Container(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: const Color.fromRGBO(255, 255, 255, .5)),
            //   child: const DropDownWidget(),
            // )),
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
                                    time: "Time",
                                    userId: controller.filteredStudents[index].userId,
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
        ));
  }
}
