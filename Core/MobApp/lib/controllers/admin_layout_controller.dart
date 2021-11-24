import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/absence_and_presence/absence_and_presence.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/add_new/add_new.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/profile/profile.dart';
import 'package:graduaiton_app/screens/admin/tables_page/tables_screen.dart';

class AdminLayoutController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final RxList<Widget> widgetOptions = <Widget>[
    const AdminHomeScreen(),
    const AdminTablesScreen(),
    const Schedule(),
    const AddNew(),
    Profile(),
  ].obs;
}
