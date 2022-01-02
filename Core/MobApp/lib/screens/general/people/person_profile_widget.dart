import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                                        margin: const EdgeInsets.only(left: 95),
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
                                                  const EdgeInsets.only(left: 20),
                                              title: Row(
                                                children: [
                                                  Text(controller
                                                      .student.user.typeString),
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
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              padding:
                                                  const EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                color: Color(0xffe4e6fd),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(1),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Expanded(
                                                  child: FlatButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "Absences",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6875f5),
                                                              fontSize:
                                                                  14))))),
                                          Container(
                                              padding:
                                                  const EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                color: Color(0xffe4e6fd),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(1),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Expanded(
                                                  child: FlatButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "Infractions",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6875f5),
                                                              fontSize:
                                                                  14))))),
                                          Container(
                                              padding:
                                                  const EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffe4e6fd),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(1),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Expanded(
                                                  child: FlatButton(
                                                      onPressed: ()=> Get.toNamed(
                                                          Routes
                                                              .adminNotification,
                                                          arguments: controller
                                                              .student.user),
                                                      child: const Text(
                                                          "Send Notification",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff6875f5),
                                                              fontSize:
                                                                  14))))),
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
                                        color: Color(0xff6875F5)),
                                  ),
                                  ListTile(
                                    title: const Text("Department"),
                                    subtitle:
                                        Text(controller.student.section.name),
                                    leading: const Icon(Icons.computer,
                                        color: Color(0xff6875F5)),
                                  ),
                                  ListTile(
                                    title: const Text("Stage"),
                                    subtitle:
                                        Text(controller.student.stage.name),
                                    leading: const Icon(Icons.event,
                                        color: Color(0xff6875F5)),
                                  ),
                                  ListTile(
                                    title: const Text("Unit"),
                                    subtitle:
                                        Text(controller.student.unit.name),
                                    leading: const Icon(Icons.event,
                                        color: Color(0xff6875F5)),
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
