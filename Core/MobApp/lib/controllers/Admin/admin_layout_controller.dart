import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_students_controller.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/people/people_screen.dart';
import 'package:graduaiton_app/screens/admin/students/students_screen.dart';

class AdminLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    tabIndex(Get.currentRoute);
    super.onInit();
  }

  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Home", "icon": Icons.home, "route": '/admin/'},
    {"title": "People", "icon": Icons.groups, "route": '/admin/people/'},
    {"title": "Students", "icon": Icons.people, "route": '/admin/students/'},

  ].obs;

  void tabIndex(String route) {
    for (var i = 0; i < tabs.length; i++) {
      if (tabs[i]['route'] == route) {
        selectedIndex.value = i;
      }
    }
  }

  void onItemTap(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
      Get.offAllNamed(tabs[index]['route']);
    }
  }
}
