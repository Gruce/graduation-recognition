import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/admin_layout_controller.dart';

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
}