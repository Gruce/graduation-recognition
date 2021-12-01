import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/people/search_widget.dart';

import '../layout.dart';
import 'person_widget.dart';

class AdminPeopleScreen extends GetView<AdminPeopleController> {
  const AdminPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'People',
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
              child: GetBuilder<AdminPeopleController>(
                  builder: (_) => controller.filteredPeople.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filteredPeople.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => Get.toNamed(Routes.personProfile,
                                    arguments:
                                        controller.filteredPeople[index].id),
                                child: PersonWidget(
                                    key: ObjectKey(
                                        controller.filteredPeople[index].id),
                                    name: controller.filteredPeople[index].name,
                                    type: controller.filteredPeople[index].type,
                                    camera: "camera",
                                    time: "time"));
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
