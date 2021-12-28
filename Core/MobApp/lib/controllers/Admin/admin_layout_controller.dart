import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    tabIndex(Get.currentRoute);
    super.onInit();
  }

  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Home", "icon": Icons.home, "route": '/admin/'},
    {"title": "Lucturers", "icon": Icons.groups, "route": '/admin/lucturers/'},
    {"title": "Students", "icon": Icons.people, "route": '/admin/students/'},
    {"title": "Lectures", "icon": Icons.schedule, "route": '/admin/lectures/'},
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
