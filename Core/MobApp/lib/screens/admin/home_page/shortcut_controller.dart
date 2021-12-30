import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminShortcutController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "users", "icon": Icons.groups_sharp, "route": '/admin/users/'},
    {"title": "lucurers", "icon": Icons.groups_sharp, "route": '/admin/lucurers/'},
    {"title": "Students","icon": Icons.people_sharp,"route": '/admin/students/'},
    {"title": "lectures","icon": Icons.notification_add,"route": '/admin/lectures/'},
  ];

  void onItemTap(int index) {
    //Notify Bottom Navbar
    AdminLayoutController bottomNavbar = Get.put(AdminLayoutController());
    bottomNavbar.tabIndex(tabs[index]['route']);

    Get.offAndToNamed(tabs[index]['route']);
  }

}
