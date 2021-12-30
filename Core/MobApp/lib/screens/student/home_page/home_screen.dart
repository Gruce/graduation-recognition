import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Student/student_lectures_controller.dart';
import 'package:graduaiton_app/controllers/student/student_home_controller.dart';
import 'package:graduaiton_app/screens/student/layout.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class StudentHomeScreen extends GetView<StudentHomeController> {
  StudentHomeScreen({Key? key}) : super(key: key);

  @override
  StudentHomeController controller = Get.put(StudentHomeController());
  StudentLecturesController controller1 = Get.put(StudentLecturesController());
  @override
  Widget build(BuildContext context) {
    return StudentLayoutScreen(
        title: 'Home',
        child: Obx(
          () => SlidingUpPanel(
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
            onPanelOpened: () => controller.showns.value = true,
            onPanelClosed: () => controller.showns.value = false,
            panel: Column(
              children: [
                const SizedBox(height: 5),
                Icon(
                  controller.showns.value
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
                      "Today Lectures ",
                      style: TextStyle(color: Color(0xff6875F5), fontSize: 18),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Container(
                        // padding:
                        // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(255, 255, 255, .5),
                        ),
                        child: Expanded(
                            child: GetBuilder<StudentLecturesController>(
                                builder: (_) => controller1
                                        .lecturesToday.isNotEmpty
                                    ? ListView.builder(
                                        itemCount:
                                            controller1.lecturesToday.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                              elevation: 0,
                                              // shadowColor: Colors.black12,
                                              color: Colors.transparent,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 24.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.93,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(controller1
                                                            .lecturesWeek[
                                                                index]
                                                            .day
                                                            .name
                                                            .toString()),
                                                        Text(controller1
                                                            .lecturesToday[
                                                                index]
                                                            .subject
                                                            .name
                                                            .toString()),
                                                        Text(controller1
                                                            .lecturesToday[
                                                                index]
                                                            .start
                                                            .toString())
                                                      ],
                                                    ),
                                                  ),
                                                  ListTile(
                                                      title: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(children: [
                                                                Text(controller1
                                                                    .lecturesToday[
                                                                        index]
                                                                    .unit
                                                                    .stage
                                                                    .name
                                                                    .toString()),
                                                              ]),
                                                              Text(controller1
                                                                  .lecturesToday[
                                                                      index]
                                                                  .unit
                                                                  .name
                                                                  .toString()),
                                                            ],
                                                          )),
                                                      subtitle: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            controller1
                                                                .lecturesToday[
                                                                    index]
                                                                .unit
                                                                .section
                                                                .name
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          )),
                                                          Text(
                                                            'Hall: ' +
                                                                controller1
                                                                    .lecturesToday[
                                                                        index]
                                                                    .classroom
                                                                    .name
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                        ],
                                                      )),
                                                  Divider(
                                                    thickness: 0.3,
                                                  )
                                                ],
                                              ));
                                        },
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: const Text('Not Found',
                                                style: TextStyle(
                                                    fontSize: 24)))))))),
              ],
            ),
            body:Column(
              children: [
                SizedBox(
                  height: 150,
                    child: Container(
                      
                        // padding:
                        // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(255, 255, 255, .5),
                        ),
                        child: Expanded(
                            child: GetBuilder<StudentHomeController>(
                                builder: (_) => controller
                                        .currentLectures.isNotEmpty
                                    ? ListView.builder(
                                        itemCount:
                                            controller.currentLectures.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            
                                              elevation: 0,
                                              // shadowColor: Colors.black12,
                                              color: Colors.transparent,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 23.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.93,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Color(0xffe4e6fd),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(controller
                                                            .currentLectures[
                                                                0]
                                                            .day
                                                            .name
                                                            .toString()),
                                                        Text(controller
                                                            .currentLectures[
                                                                0]
                                                            .subject
                                                            .name
                                                            .toString()),
                                                        Text(controller
                                                            .currentLectures[
                                                                0]
                                                            .start
                                                            .toString())
                                                      ],
                                                    ),
                                                  ),
                                                  ListTile(
                                                      title: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(children: [
                                                                Text(controller
                                                                    .currentLectures[
                                                                        0]
                                                                    .unit
                                                                    .stage
                                                                    .name
                                                                    .toString()),
                                                              ]),
                                                              Text(controller
                                                                  .currentLectures[
                                                                      0]
                                                                  .unit
                                                                  .name
                                                                  .toString()),
                                                            ],
                                                          )),
                                                      subtitle: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            controller
                                                                .currentLectures[
                                                                    0]
                                                                .unit
                                                                .section
                                                                .name
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          )),
                                                          Text(
                                                            'Hall: ' +
                                                                controller
                                                                    .currentLectures[
                                                                        0]
                                                                    .classroom
                                                                    .name
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6)),
                                                          ),
                                                        ],
                                                      )),
                                                      SizedBox(height: 40,),
                                                  Divider(
                                                    thickness: 0.3,
                                                  ),
                                                ],
                                              ));
                                        },
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: const Text('Not Found',
                                                style: TextStyle(
                                                    fontSize: 24)
                                                    )
                                                    )
                                                    )
                                                    )
                                                    )
                                                    )
                                                    ),
               
                
              ],
            )
          ),
        ));
  }
}
