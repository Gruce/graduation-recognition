import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_people_controller.dart';
import 'package:graduaiton_app/screens/admin/people/search_widget.dart';

import 'person_widget.dart';

class AdminPeopleScreen extends GetView<AdminPeopleController> {
  const AdminPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          children: [
            // Search Container
            SearchWidget(),
            const SizedBox(height: 20),
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.filteredpeople.length,
                  itemBuilder: (context, i) {
                    return PersonWidget(
                        name: controller.filteredpeople[i].name,
                        type: controller.filteredpeople[i].type,
                        camera: "Main Camera",
                        time: "3 hours ago");
                  },
                ))
          ],
        ));
  }
}