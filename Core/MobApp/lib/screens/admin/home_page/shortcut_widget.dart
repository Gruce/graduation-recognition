import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/admin/home_page/shortcut_controller.dart';
import 'package:graduaiton_app/screens/admin/lectures/lectures_screen.dart';
import 'package:graduaiton_app/screens/admin/students/students_screen.dart';
import 'package:graduaiton_app/screens/general/luctures/luctures_controller.dart';

class ShortcutsWidget extends StatelessWidget {
   ShortcutsWidget({Key? key}) : super(key: key);

  AdminShortcutController controller = Get.put(AdminShortcutController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: 100,
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Row(
        children: [
          GestureDetector(
           onTap: () => {controller.onItemTap(0)},
            child: SizedBox(
              // width: 60,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.group_work_outlined, color: Color(0xff6875F5)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "All Users",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6875F5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40,),
          GestureDetector(
             onTap: () => {controller.onItemTap(1)},
            child: SizedBox(
              // width: 60,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.groups_outlined, color: Color(0xff6875F5)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lucturers",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6875F5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40,),
           GestureDetector(
           onTap: () => {controller.onItemTap(2)},
            child: SizedBox(
              // width: 60,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.group_outlined, color: Color(0xff6875F5)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Students",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6875F5)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40,),

           GestureDetector(
           onTap: () => {controller.onItemTap(3)},
            child: SizedBox(
              // width: 60,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:const Icon(Icons.speaker_group_outlined, color: Color(0xff6875F5)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lectures",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff6875F5)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}






//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> categories = [
//       {
//         "icon": Icons.groups_outlined,
//         "text": "All Users",
//       },
//       {"icon": Icons.group_work_outlined, "text": "Lucturers"},
//       {"icon": Icons.group_outlined, "text": "Students"},
//       {"icon": Icons.speaker_group_outlined, "text": "Lectures"},
//     ];
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: List.generate(
//           categories.length,
//           (index) => CategoryCard(
//             icon: categories[index]["icon"],
//             text: categories[index]["text"],
//             press: () {
//               categories[index]["press"];
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final icon, text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: press,
//             child: SizedBox(
//               width: 60,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(15),
//                     height: 55,
//                     width: 55,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(icon, color: const Color(0xff6875F5)),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(text!,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(color: Color(0xff6875F5)),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
