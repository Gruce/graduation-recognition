// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
// import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';
// import 'package:graduaiton_app/routes/routes.dart';
// import 'package:graduaiton_app/screens/admin/students/student_widget.dart';
// import 'package:graduaiton_app/screens/admin/students/students_search_widget.dart';
// import '../../layout.dart';
// import 'section_widget.dart';

// class AdminSectionsScreen extends GetView<AdminSectionsController> {
//   const AdminSectionsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//         child: Column(
//           children: [
//             // Search Container
//             StudentsSearchWidget(),
//             // DropDownWidget(),
//             const SizedBox(height: 20),
//             Container(
//               width: 300.0,
//                decoration: BoxDecoration(
//         color: Colors.white.withOpacity(1),
//         border: Border.all(
//           color: Colors.white.withOpacity(1),
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//               // color: Colors.blue[300],
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
                  
//                   children: const [
//                     // SectionDropDown(),
//                     // SizedBox(width: 20,),
//                     // //  SectionDropDown(),
//                     // StageDropDown(),
//                     // SizedBox(width: 20,),
//                     // //  SectionDropDown(),
//                     // UnitDropDown(),
//                   ]),
//             ),

//             const SizedBox(height: 20),
//             // Expanded(
//             //     child: Container(
//             //   padding:
//             //       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             //   decoration: BoxDecoration(
//             //       borderRadius: BorderRadius.circular(20),
//             //       color: const Color.fromRGBO(255, 255, 255, .5)),
//             //   child: const DropDownWidget(),
//             // )),
//             Expanded(
//                 child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: const Color.fromRGBO(255, 255, 255, .5)),
//               child: GetBuilder<AdminStudentsController>(
//                   builder: (_) => controller.filteredSections.isNotEmpty
//                       ? ListView.builder(
//                           itemCount: controller.filteredSections.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                                 onTap: () => Get.toNamed(Routes.personProfile,
//                                     arguments:
//                                         controller.filteredSections[index].id),
//                                 child: SectionWidget(
//                                     key: ObjectKey(
//                                         controller.filteredSections[index].id),
//                                     name: controller.filteredSections[index].name,
//                                      id: controller.filteredSections[index].id,
                                   
//                                      ));
//                           },
//                         )
//                       : SizedBox(
//                           width: double.infinity,
//                           child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10.0, vertical: 5.0),
//                               child: const Text('Not Found',
//                                   style: TextStyle(fontSize: 24))))),
//             )),
           
//           // Expanded(child:Text(name) , ),
//         ],
//         ),
//         );
//   }
// }
