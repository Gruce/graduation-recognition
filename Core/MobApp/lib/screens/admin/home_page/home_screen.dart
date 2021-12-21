import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../layout.dart';
import 'today_lucture_widget.dart';

class AdminHomeScreen extends GetView<AdminHomeController> {
  AdminHomeScreen({Key? key}) : super(key: key);
  AdminPeopleController controller1 = Get.put(AdminPeopleController());
  AdminStudentsController controller2 = Get.put(AdminStudentsController());

  @override
  Widget build(BuildContext context) {
    return AdminLayoutScreen(
        title: 'Home',
        child: Obx(() => SlidingUpPanel(
              backdropEnabled: true,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              margin: const EdgeInsets.only(left: 7.5, right: 7.5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 0.0,
                )
              ],
              minHeight: 75,
              onPanelOpened: () => controller.shown.value = true,
              onPanelClosed: () => controller.shown.value = false,
              panel: Column(
                children: [
                  const SizedBox(height: 5),
                  Icon(
                    controller.shown.value
                        ? Icons.expand_more
                        : Icons.expand_less,
                    size: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: const Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                      child: const Text(
                        "Today's Lectures",
                        style:
                            TextStyle(color: Color(0xff6875F5), fontSize: 18),
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      child: Container(
                    // padding:
                    // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(255, 255, 255, .5),
                    ),
                    child: GetBuilder<AdminPeopleController>(
                        builder: (_) => controller1.filteredPeople.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller1.filteredPeople.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      onTap: () => Get.toNamed(
                                          Routes.personProfile,
                                          arguments: controller1
                                              .filteredPeople[index].id),
                                      child: LuctureWidget(
                                        key: ObjectKey(controller1
                                            .filteredPeople[index].id),
                                        luctureName: "PHP",
                                        hall: "Hall 9",
                                        startAt: "8:30 am",
                                        endAt: "10:30 am",
                                        lucturerName: "Hassan Alkhalidy",
                                        section: "Computer Science",
                                        stage: "First Stage",
                                        unit: "A",
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
              ),
              body: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        buildInfo(controller1.people.length.toString(),
                            'Lucturers\nN.O'),
                        Container(
                            width: 1,
                            height: 50,
                            color: const Color(0xff6875F5)),
                        buildInfo(controller2.students.length.toString(),
                            'Students\nN.O'),
                        Container(
                            width: 1,
                            height: 50,
                            color: const Color(0xff6875F5)),
                        buildInfo('15', 'Cameras\nN.O'),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

Padding buildInfo(String value, String description) {
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: <Widget>[
        Text(
          value,
          style: const TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: Color(0xff6875F5),
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xff6875F5),
          ),
        )
      ]));
}
