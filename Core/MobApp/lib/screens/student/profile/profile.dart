// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/student/student_profile_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/student/layout.dart';
import 'package:graduaiton_app/screens/student/profile/absences_screen.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';

import '../../admin/layout.dart';

class StudentsProfileScreen extends GetView {
  StudentsProfileScreen({Key? key}) : super(key: key);

  @override
   StudentProfileController controller = Get.put(StudentProfileController());

  @override
  Widget build(BuildContext context) {
    controller.getUser;
    return StudentLayoutScreen(
        title: 'Person Profile',
        child: SingleChildScrollView(
          child: GetBuilder<StudentProfileController>(
              builder: (_) => controller.student.value.user.name.isNotEmpty
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
                                                        .student.value.user.name,
                                                    style: const TextStyle(
                                                        fontSize: 22,
                                                        color:
                                                            Colors.black))

                                                // style: Theme.of(context).textTheme.title,
                                                ),
                                            ListTile(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 15),
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                                .circular(7),
                                                      ),
                                                      child: Expanded(
                                                        child: Text(
                                                          controller.student.value
                                                              .user.typeString,
                                                          style:const TextStyle(
                                                              color:
                                                                  Colors.white),textAlign: TextAlign.center,
                                                        ),
                                                      )),
                                                       GestureDetector(
                                                         onTap: () => Get.to(() => AbsencesScreen()),
                                                         child: Container(
                                                          width: 130,
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
                                                                  .circular(7),
                                                          ),
                                                        
                                                          child: Text(
                                                            'Show Absences',
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
                                              // child: Expanded(
                                              //     child: FlatButton(
                                              //         onPressed: () => { controller.getStudentId(controller.student.id),
                                              //         Get.toNamed(
                                              //             Routes
                                              //                 .adminStudentAbsences,
                                              //             arguments: controller
                                              //                 .student.user),
                                              //                 },
                                                                                                              
                                              //         child: const Text(
                                              //             "Show Absences",textAlign: TextAlign.center,
                                              //             style: TextStyle(
                                              //                 color:
                                              //                     Color(0xff8892f7),
                                              //                 fontSize: 14))))
                                                              ),
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
                                              
                                                              ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
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
                                        image: NetworkImage(
                                                'http://www.familylore.org/images/2/25/UnknownPerson.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                
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
                                        Text(controller.student.value.user.email),
                                    leading: const Icon(Icons.email,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Department"),
                                    subtitle:
                                        Text(controller.student.value.section.name),
                                    leading: const Icon(Icons.computer,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Stage"),
                                    subtitle:
                                        Text(controller.student.value.stage.name),
                                    leading: const Icon(Icons.event,
                                        color: Color(0xff8892f7)),
                                  ),
                                  ListTile(
                                    title: const Text("Unit"),
                                    subtitle:
                                        Text(controller.student.value.unit.name),
                                    leading: const Icon(Icons.ac_unit,
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
