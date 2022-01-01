// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_absences_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';

import '../../admin/layout.dart';
import 'person_profile_controller.dart';

class PersonProfileWidget extends GetView {
  PersonProfileWidget({Key? key}) : super(key: key);

  @override
  PersonProfileController controller = Get.put(PersonProfileController());

  @override
  Widget build(BuildContext context) {
    controller.getUser(Get.arguments);
    return AdminLayoutScreen(
        title: 'Person Profile',
        child: SingleChildScrollView(
          child: GetBuilder<PersonProfileController>(
              builder: (_) => controller.student.user.name.isNotEmpty
                  ? Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 80),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ListTile(
                                                title: Text(
                                                    controller
                                                        .student.user.name,
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color:
                                                            Color(0xff6875F5)))

                                                // style: Theme.of(context).textTheme.title,
                                                ),
                                            ListTile(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 15),
                                              title: Row(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    height: 30,
                                                      padding:
                                                          const EdgeInsets.only(top: 5),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff8892f7),
                                                        border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(1),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Expanded(
                                                        child: Text(
                                                          controller.student
                                                              .user.typeString,
                                                          style:const TextStyle(
                                                              color:
                                                                  Colors.white),textAlign: TextAlign.center,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              //You can add Subtitle here
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding:const EdgeInsets.only(left: 15,right: 15),
                                              decoration: BoxDecoration(
                                                color:  Colors.grey[200],
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(1),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Expanded(
                                                  child: FlatButton(
                                                      onPressed: () => { controller.getStudentId(controller.student.id),
                                                      Get.toNamed(
                                                          Routes
                                                              .adminStudentAbsences,
                                                          arguments: controller
                                                              .student.user),
                                                              },
                                                                                                              
                                                      child: const Text(
                                                          "Show Absences",textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Color(0xff8892f7),
                                                              fontSize: 14))))),
                                          Container(
                                            padding:const EdgeInsets.only(left: 15,right: 15),
                                              decoration: BoxDecoration(
                                                color:  Colors.grey[200],
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(1),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Expanded(
                                                  child: FlatButton(
                                                      onPressed: () => Get.toNamed(
                                                          Routes
                                                              .adminNotification,
                                                          arguments: controller
                                                              .student.user),
                                                      child: const Text(
                                                          "Send Notification",textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                   Color(0xff8892f7),
                                                              fontSize: 14))))),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => Container(
                                    width: 80,
                                    height: 80,
                                    margin: const EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          blurRadius: 10,
                                          color:
                                              Colors.black.withOpacity(0.075),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: controller
                                                .imageURL.value.isNotEmpty
                                            ? NetworkImage(
                                                controller.imageURL.value)
                                            : const NetworkImage(
                                                'http://www.familylore.org/images/2/25/UnknownPerson.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  const ListTile(
                                    title: Text(
                                      "Person Information",
                                      style:
                                          TextStyle(color: Color(0xff6875F5)),
                                    ),
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: const Text("Email"),
                                    subtitle:
                                        Text(controller.student.user.email),
                                    leading: const Icon(Icons.email,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Department"),
                                    subtitle:
                                        Text(controller.student.section.name),
                                    leading: const Icon(Icons.computer,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Stage"),
                                    subtitle:
                                        Text(controller.student.stage.name),
                                    leading: const Icon(Icons.event,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Unit"),
                                    subtitle:
                                        Text(controller.student.unit.name),
                                    leading: const Icon(Icons.event,
                                        color: Color(0xff8892f7)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
        ));
  }
}
