// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduaiton_app/controllers/Admin/admin_students_absences_controller.dart';
// import 'package:graduaiton_app/routes/routes.dart';
// import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';

// import '../../admin/layout.dart';
// import 'person_profile_controller.dart';

// class StudentAbsence extends GetView {
//   StudentAbsence({Key? key}) : super(key: key);

//   @override
//   PersonProfileController controller = Get.put(PersonProfileController());
//   AdminStudentsAbsencesController absenceController =
//       AdminStudentsAbsencesController();
//   @override
//   Widget build(BuildContext context) {
//     return AdminLayoutScreen(
//         title: 'Absences',
//         child: SingleChildScrollView(
//           child: GetBuilder<AdminStudentsAbsencesController>(
//               builder: (_) => controller.student.user.name.isNotEmpty
//                   ? Column(
//                       children: <Widget>[
//                         Column(
//                           children: <Widget>[
//                             Stack(
//                               children: <Widget>[
//                                GetBuilder<AdminStudentsAbsencesController>(
//                 builder: (_) => absenceController.loaded.value
//                     ? Column(
//                                      children: List.from(absenceController.student.absences)
//                             .map(
//                               (absence) => Card(
//                                 elevation: 0,
//                                 color: Colors.transparent,
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 5.0),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(5.0),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: const Color.fromRGBO(
//                                           255, 255, 255, 1)),
//                                   child: ListTile(
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         horizontal: 25.0, vertical: 10.0),
//                                     title: Container(
//                                       margin:
//                                           const EdgeInsets.only(bottom: 10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             absence.subject.name,
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 color: Color(0xff6875F5)),
//                                           ),
//                                           Container(
//                                               padding:
//                                                   const EdgeInsets.all(5.0),
//                                               decoration: BoxDecoration(
//                                                 color: const Color.fromRGBO(
//                                                     235, 235, 235, .8),
//                                                 border: Border.all(
//                                                   color: const Color.fromRGBO(
//                                                       235, 235, 235, .8),
//                                                   width: 2.0,
//                                                 ),
//                                                 borderRadius: const BorderRadius
//                                                         .all(
//                                                     Radius.circular(
//                                                         5.0) //                 <--- border radius here
//                                                     ),
//                                               ),
//                                               child: Text(
//                                                 absence.subject.absencesCount,
//                                                 style: const TextStyle(
//                                                   fontSize: 15,
//                                                   color: Color(0xff6875F5),
//                                                 ),
//                                               ))
//                                         ],
//                                       ),
//                                     ),
//                                     subtitle: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: <Widget>[
//                                         Container(
//                                           padding: const EdgeInsets.all(5.0),
//                                           decoration: BoxDecoration(
//                                             color: const Color.fromRGBO(
//                                                 235, 235, 235, .8),
//                                             border: Border.all(
//                                               color: const Color.fromRGBO(
//                                                   235, 235, 235, .8),
//                                               width: 2.0,
//                                             ),
//                                             borderRadius: const BorderRadius
//                                                     .all(
//                                                 Radius.circular(
//                                                     5.0) //                 <--- border radius here
//                                                 ),
//                                           ),
//                                           child: Row(
//                                             children: const [
//                                               Icon(
//                                                 Icons.photo_camera_outlined,
//                                                 size: 14,
//                                               ),
//                                               SizedBox(width: 5),
//                                               Text(
//                                                   // camera.isNotEmpty ? camera :
//                                                   "Section",
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                   ))
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(width: 15),
//                                         Container(
//                                           padding: const EdgeInsets.all(5.0),
//                                           decoration: BoxDecoration(
//                                             color: const Color.fromRGBO(
//                                                 235, 235, 235, .8),
//                                             border: Border.all(
//                                               color: const Color.fromRGBO(
//                                                   235, 235, 235, .8),
//                                               width: 2.0,
//                                             ),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(5.0)),
//                                           ),
//                                           child: Row(
//                                             children: const [
//                                               Icon(
//                                                 Icons.schedule,
//                                                 size: 14,
//                                               ),
//                                               SizedBox(width: 5),
//                                               Text(
//                                                   // time.isNotEmpty ? time :
//                                                   "Stage",
//                                                   style:
//                                                       TextStyle(fontSize: 12))
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(width: 15),
//                                         Container(
//                                           padding: const EdgeInsets.all(5.0),
//                                           decoration: BoxDecoration(
//                                             color: const Color.fromRGBO(
//                                                 235, 235, 235, .8),
//                                             border: Border.all(
//                                               color: const Color.fromRGBO(
//                                                   235, 235, 235, .8),
//                                               width: 2.0,
//                                             ),
//                                             borderRadius:
//                                                 const BorderRadius.all(
//                                                     Radius.circular(5.0)),
//                                           ),
//                                           child: Row(
//                                             children: const [
//                                               Icon(
//                                                 Icons
//                                                     .store_mall_directory_outlined,
//                                                 size: 14,
//                                               ),
//                                               SizedBox(width: 5),
//                                               Text(
//                                                   // time.isNotEmpty ? time :
//                                                   "Unit",
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                   ))
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
//                                   ),
//                                 ),
//                               ),
//                             )
//                             .toList(),
//                                   ):Container(),
                                    
//                                   ),
                                
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     )
//                   : const Center(
//                       child: Text("not fuck"),
//                     )),
//         ));
//   }
// }
