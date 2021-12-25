// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';
// import 'package:graduaiton_app/screens/student/layout.dart';

// class SubjectStudentScreen extends GetView {
//   SubjectStudentScreen({Key? key}) : super(key: key);
//   @override
//   SubjectsStudentController controller = Get.put(SubjectsStudentController());
//   @override
//   Widget build(BuildContext context) {
//     return StudentLayoutScreen(
//         title: 'My Subjects',
//         child: Column(children: [
//           // StudentSearchWidget(),
//           // const Text("data"),
//           Expanded(
//               child: GetBuilder<SubjectsStudentController>(
//                   builder: (_) => controller.subject.isNotEmpty
//                       ? ListView.builder(
//                           itemCount: controller.subject.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                               onTap: () =>controller.d(controller.subject[index].id),
//                               child: Card(
//                                   margin: EdgeInsets.all(15),
//                                   shape: BeveledRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   elevation: 0,
//                                   child: Container(
//                                       padding: const EdgeInsets.all(15),
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xffd4d8ff),
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           ListTile(
//                                             title: Container(
//                                                 margin: const EdgeInsets.only(
//                                                     bottom: 15),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Column(children: [
//                                                       Text(
//                                                         controller
//                                                             .subject[index]
//                                                             .name,
//                                                         style: TextStyle(
//                                                             fontSize: 18),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(
//                                                         controller
//                                                             .subject[index]
//                                                             .teachers[0]
//                                                             .user
//                                                             .name,
//                                                         style: TextStyle(
//                                                             fontSize: 15),
//                                                       ),
//                                                     ])
//                                                   ],
//                                                 )),
//                                           ),
//                                         ],
//                                       ))),
//                             );
//                           })
//                       : SizedBox(
//                           width: double.infinity,
//                           child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 5.0),
//                               child: const Text('Not Found',
//                                   style: TextStyle(fontSize: 24))))))
//         ]));
//   }

  
// }
