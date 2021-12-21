import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';


// ignore: must_be_immutable
class TeacherBottomNavigationBar extends GetWidget {
  TeacherBottomNavigationBar({Key? key}) : super(key: key);

  @override
  TeacherLayoutController controller = Get.put(TeacherLayoutController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      currentIndex: controller.selectedIndex.value,
      onTap: (index) => controller.onItemTap(index),
      selectedItemColor: const Color(0xff6875F5),
      selectedFontSize: 13.0,
      showUnselectedLabels: false,
      items: controller.tabs
          .map((element) => BottomNavigationBarItem(
        icon: Icon(
          element['icon'],
        ),
        label: element['title'],
      ))
          .toList(),
    ));
  }
}