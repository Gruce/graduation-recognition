import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_absences_controller.dart';
import 'package:graduaiton_app/controllers/Student/student_profile_controller.dart';
import 'package:graduaiton_app/screens/student/profile/layout_absences.dart';
import 'package:intl/intl.dart';

class AbsencesScreen extends GetView {
  AbsencesScreen({Key? key}) : super(key: key);
  @override
  AbsencesController controller = Get.put(AbsencesController());
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var formattedDate = dateFormat.format;
    return AbsencessLayouttScreen(
        title: 'Lectures of the Week',
        child: Column(
          children: [
            Expanded(
                child: GetBuilder<AbsencesController>(
                    builder: (_) => controller.student.value.absences.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.student.value.absences.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                // onTap: () => Get.to(() => StudentsProfileWidget(),
                                // arguments: controller.students[index].id),
                                child: Card(
                                    elevation: 0,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color:
                                              Color.fromRGBO(249, 249, 249, 1),
                                          width: 0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Column(
                                          children: [
                                            ListTile(
                                                title: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(controller
                                                            .student
                                                            .value
                                                            .absences[index]
                                                            .subject
                                                            .name),
                                                        Container(
                                                          height: 20,
                                                          width: 129,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                          child: Text(controller
                                                              .student
                                                              .value
                                                              .absences[index]
                                                              .created_at),
                                                        ),
                                                      ],
                                                    )),
                                                subtitle: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      'f',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                    Container(
                                                        height: 20,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              243, 243, 243, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: Row(
                                                          children: const [
                                                            Text(
                                                              ' Absences : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Center(
                                                                child:
                                                                    Text('0'))
                                                          ],
                                                        )),
                                                  ],
                                                )),
                                          ],
                                        ))),
                              );
                            })
                        : Container())),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
