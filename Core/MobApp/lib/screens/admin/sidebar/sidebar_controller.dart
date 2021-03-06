import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSidebarController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Users", "icon": Icons.groups_sharp, "route": '/admin/users/'},
    {
      "title": "Students",
      "icon": Icons.people_sharp,
      "route": '/admin/students/'
    },
    {
      "title": "Lucturers",
      "icon": Icons.person_outlined,
      "route": '/admin/lucurers/'
    },
    {
      "title": "Lectures",
      "icon": Icons.layers_outlined,
      "route": '/admin/lectures/'
    },
    {
      "title": "Notification",
      "icon": Icons.notification_add,
      "route": '/admin/notification/'
    },
    // {
    //   "title": "Absences",
    //   "icon": Icons.warning_amber_sharp,
    //   "route": '/general/student/Absences/'
    // },
  ];

  late SharedPreferences prefs;
  var user = UserModel();

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    Map data = json.decode(prefs.getString('user') ?? '');
    user = UserModel.fromJson(data);
    update();
    super.onInit();
  }

  void onItemTap(int index) {
    //Notify Bottom Navbar
    AdminLayoutController bottomNavbar = Get.put(AdminLayoutController());
    bottomNavbar.tabIndex(tabs[index]['route']);

    Get.offAndToNamed(tabs[index]['route']);
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', '');
    Get.toNamed(Routes.login);
  }
}
