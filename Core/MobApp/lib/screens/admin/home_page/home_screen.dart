import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';

import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/home_page/camera_widget.dart';

import '../layout.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Home',
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(255, 255, 255, .5)),
              child: GetBuilder<AdminHomeController>(
                  builder: (_) => controller.cameras.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.cameras.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () => Get.toNamed(Routes.personProfile,
                                    arguments: controller.cameras[index].id),
                                child: CameraWidget(
                                  description:
                                      controller.cameras[index].description,
                                  state: controller.cameras[index].state,
                                  source: controller.cameras[index].source,
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
            )),
          ],
        ));
  }
}
