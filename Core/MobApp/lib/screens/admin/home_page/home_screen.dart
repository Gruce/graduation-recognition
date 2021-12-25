import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/general/luctures/lecture_widget.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_wiget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../layout.dart';

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
                  Obx(() => controller.lectures.isNotEmpty
                      ? Expanded(
                          flex: 1,
                          child: LucturesWidget(
                            lectures: controller.lectures,
                            today: true,
                          ))
                      : Container())
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
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 13,
                      top: 29,
                      left: 30,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Lucturers',
                            style: TextStyle(
                                color: Color(0xff6875F5), fontSize: 18)),
                        Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 40,
                              margin: const EdgeInsets.only(right: 6),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff6875F5),
                              ),
                              child: Text(
                                controller1.people.length.toString(),
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                      itemCount: 10,
                      padding: const EdgeInsets.only(left: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: LucturersCard(
                            luctures: 'Abdulkareem',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}

class LucturersCard extends StatefulWidget {
  final String luctures;

  LucturersCard({
    Key? key,
    required this.luctures,
  }) : super(key: key);

  @override
  _LucturersCardState createState() => _LucturersCardState();
}

class _LucturersCardState extends State<LucturersCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 120,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff6875F5),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(2.0, 2.0),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.person,
            color: Color(0xff6875F5),
            size: 30,
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            "Abdulkareem",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xff6875F5)),
          )
        ],
      ),
    );
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
