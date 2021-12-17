import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_home_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_people_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:swipedetector/swipedetector.dart';
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
        child: Column(
          children: [
            Obx(
              () => controller.shown.value
                  ? Container(
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
                    )
                  : Container(),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text(
                    "Today Luctures",
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(255, 255, 255, .5)),
              child: GetBuilder<AdminPeopleController>(
                  builder: (_) => controller1.filteredPeople.isNotEmpty
                      ? SwipeDetector(
                          onSwipeUp: () {
                            print("fuckkkkkkkkkkkkkk");
                          },
                          child: ListView.builder(
                            itemCount: controller1.filteredPeople.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () => Get.toNamed(Routes.personProfile,
                                      arguments:
                                          controller1.filteredPeople[index].id),
                                  child: LuctureWidget(
                                    key: ObjectKey(
                                        controller1.filteredPeople[index].id),
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
                          ))
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))))),
            ))
            // Expanded(
            //     child: Container(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: const Color.fromRGBO(255, 255, 255, .5)),
            //   child: GetBuilder<AdminHomeController>(
            //       builder: (_) => controller.cameras.isNotEmpty
            //           ? ListView.builder(
            //               itemCount: controller.cameras.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return GestureDetector(
            //                     onTap: () => Get.toNamed(Routes.personProfile,
            //                         arguments: controller.cameras[index].id),
            //                     child: CameraWidget(
            //                       description:
            //                           controller.cameras[index].description,
            //                       state: controller.cameras[index].state,
            //                       source: controller.cameras[index].source,
            //                     ));
            //               },
            //             )
            //           : SizedBox(
            //               width: double.infinity,
            //               child: Container(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 10.0, vertical: 5.0),
            //                   child: const Text('Not Found',
            //                       style: TextStyle(fontSize: 24))))),
            // )),
          ],
        ));
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
