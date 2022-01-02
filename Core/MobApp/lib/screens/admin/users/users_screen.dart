import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_users_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/users/search_widget.dart';

import '../layout.dart';
import 'person_widget.dart';

class AdminUsersScreen extends GetView {
  AdminUsersScreen({Key? key}) : super(key: key);

  @override
  AdminUsersController controller = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Users',
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
              child: GetBuilder<AdminUsersController>(
                  builder: (_) => controller.filteredUsers.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.filteredUsers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => Get.toNamed(Routes.personProfile,
                                    arguments:
                                        controller.filteredUsers[index].id),
                                child: PersonWidget(
                                    key: ObjectKey(
                                        controller.filteredUsers[index].id),
                                    name: controller.filteredUsers[index].name,
                                    type: controller.filteredUsers[index].type,
                                    camera:"camera",
                                    //  controller.filteredPeople[index].trackings.camera.description,
                                    time:"time",
                                    // controller.filteredPeople[index].trackings.seen,
                                    typeString: controller.filteredUsers[index].typeString));
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
