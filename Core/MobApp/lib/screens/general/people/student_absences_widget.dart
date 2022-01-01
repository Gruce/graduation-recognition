import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_lectures_controller.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_absences_controller.dart';
import 'package:graduaiton_app/models/absences.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';
import 'package:graduaiton_app/screens/general/people/lectures_absences_filter_widget.dart';
import 'package:graduaiton_app/screens/general/people/person_profile_controller.dart';

import 'student_absence.dart';

class AdminStudentAbsences extends GetView {
  AdminStudentAbsences({Key? key}) : super(key: key);

  @override
  AdminLecturesController controller = AdminLecturesController();

  @override
  PersonProfileController studentController =
      Get.put(PersonProfileController());
  AdminStudentsAbsencesController absenceController =
      AdminStudentsAbsencesController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        // body: StudentAbsence(),
        body: Column(
          children: [
            GetBuilder<AdminStudentsAbsencesController>(
                builder: (_) => absenceController.loaded.value
                    ? Column(
                        children: List.from(absenceController.student.absences)
                            .map(
                              (absence) => Card(
                                elevation: 0,
                                color: Colors.transparent,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1)),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10.0),
                                    title: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            absence.subject.name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff6875F5)),
                                          ),
                                          Container(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    235, 235, 235, .8),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      235, 235, 235, .8),
                                                  width: 2.0,
                                                ),
                                                borderRadius: const BorderRadius
                                                        .all(
                                                    Radius.circular(
                                                        5.0) //                 <--- border radius here
                                                    ),
                                              ),
                                              child: Text(
                                                absence.subject.absencesCount,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff6875F5),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                235, 235, 235, .8),
                                            border: Border.all(
                                              color: const Color.fromRGBO(
                                                  235, 235, 235, .8),
                                              width: 2.0,
                                            ),
                                            borderRadius: const BorderRadius
                                                    .all(
                                                Radius.circular(
                                                    5.0) //                 <--- border radius here
                                                ),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.photo_camera_outlined,
                                                size: 14,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                  // camera.isNotEmpty ? camera :
                                                  "Section",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                235, 235, 235, .8),
                                            border: Border.all(
                                              color: const Color.fromRGBO(
                                                  235, 235, 235, .8),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5.0)),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons.schedule,
                                                size: 14,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                  // time.isNotEmpty ? time :
                                                  "Stage",
                                                  style:
                                                      TextStyle(fontSize: 12))
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                235, 235, 235, .8),
                                            border: Border.all(
                                              color: const Color.fromRGBO(
                                                  235, 235, 235, .8),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5.0)),
                                          ),
                                          child: Row(
                                            children: const [
                                              Icon(
                                                Icons
                                                    .store_mall_directory_outlined,
                                                size: 14,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                  // time.isNotEmpty ? time :
                                                  "Unit",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Container()),

            // SizedBox(height: 10,),
            // Container(
            //     padding: const EdgeInsets.only(left: 10, right: 10),
            //     decoration: BoxDecoration(
            //       color: Colors.grey[200],
            //       border: Border.all(
            //         color: Colors.white.withOpacity(1),
            //         width: 1.0,
            //       ),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Expanded(
            //         child: FlatButton(
            //             onPressed: () => Get.toNamed(Routes.adminNotification,
            //                 arguments: studentController.student.user),
            //             child: const Text("Send Attention",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(

            //                     color: Color(0xff8892f7), fontSize: 14))))),
          ],
        ));
  }

  _appBar(BuildContext) {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'Student Absences',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0,
        backgroundColor: Color(0xFAFAFA),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () {
            Get.back();
          },
        ));
  }
}
