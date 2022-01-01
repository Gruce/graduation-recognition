import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Home", "icon": Icons.home, "route": '/teacher/'},
    
    {"title": "Units", "icon": Icons.local_library, "route": '/teacher/units/'},
    {
      "title": "Notification",
      "icon": Icons.mail,
      "route": '/teacher/notification/'
    },
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
      Get.toNamed(tabs[index]['route']);
    }
  }
}
