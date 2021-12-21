import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeacherSidebarController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [

    {"title": "Notification", "icon": Icons.notification_add, "route": '/teacher/notification/'},
  ];


  void onItemTap(int index) {
    //Notify Bottom Navbar
    TeacherLayoutController bottomNavbar = Get.put(TeacherLayoutController());
    bottomNavbar.tabIndex(tabs[index]['route']);

    Get.offAndToNamed(tabs[index]['route']);
  }
  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', '');
    Get.toNamed(Routes.login);
  }
}