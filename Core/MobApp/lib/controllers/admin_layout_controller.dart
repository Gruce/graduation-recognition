import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/people/people_screen.dart';
import 'package:graduaiton_app/screens/admin/profile/profile_screen.dart';

class AdminLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Map<dynamic, dynamic>> tabs = [
    {"title": "Home", "icon": Icons.home, "screen": const AdminHomeScreen()},
    {"title": "People", "icon": Icons.people, "screen": AdminPeopleScreen()},
    {"title": "Profile", "icon": Icons.person, "screen": AdminProfileScreen()},
  ].obs;

  void onItemTap(int index) {
    selectedIndex.value = index;
    print(index);
  }
}
