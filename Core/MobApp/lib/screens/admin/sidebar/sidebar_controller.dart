import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSidebarController extends GetxController {
  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "People", "icon": Icons.people, "route": '/admin/people/'},
    {"title": "Tables", "icon": Icons.table_chart, "route": '/admin/tables/'},
  ];

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
