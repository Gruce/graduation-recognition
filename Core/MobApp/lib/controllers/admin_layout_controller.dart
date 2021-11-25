import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/profile/profile.dart';
import 'package:graduaiton_app/screens/admin/tables_page/tables_screen.dart';

import 'admin_profile_controller.dart';

class AdminLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Home", "icon": Icons.home, "screen": const AdminHomeScreen()},
    {"title": "Profile", "icon": Icons.person, "screen": AdminProfileController()},
   
  ].obs;

  void onItemTap(int index) {
    selectedIndex.value = index;
  }
}
