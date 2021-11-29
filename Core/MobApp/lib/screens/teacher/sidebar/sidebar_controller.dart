import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';


class TeacherSidebarController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [
    
    {"title": "Tables", "icon": Icons.table_chart, "route": '/teacher/tables/'},
  ];


  void onItemTap(int index) {
    //Notify Bottom Navbar
    TeacherLayoutController bottomNavbar = Get.put(TeacherLayoutController());
    bottomNavbar.tabIndex(tabs[index]['route']);

    Get.offAndToNamed(tabs[index]['route']);
  }
}