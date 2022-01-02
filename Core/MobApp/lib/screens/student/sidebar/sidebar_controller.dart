import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/student/student_layout_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentSidebarController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Profile", "icon": Icons.person, "route": '/student/profile/'},
    {
      "title": "Change the stage",
      "icon": Icons.change_circle,
      "route": '/student/x/'
    },
  ];

  void onItemTap(int index) {
    //Notify Bottom Navbar
    StudentLayoutController bottomNavbar = Get.put(StudentLayoutController());
    bottomNavbar.tabIndex(tabs[index]['route']);

    Get.offAndToNamed(tabs[index]['route']);
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', '');
    Get.toNamed(Routes.login);
  }
}
