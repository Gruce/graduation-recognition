import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/admin_layout_controller.dart';
import 'home_page/appbar.dart';
import 'nav_bar/navbar.dart';
import 'sidebar.dart';

class AdminLayoutScreen extends GetView<AdminLayoutController> {
  const AdminLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: const AdminSidebar(),
        bottomNavigationBar: AdminBottomNavigationBar(),
        // body: child
        body: SafeArea(
          bottom: false,
          child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const AdminAppbar(),
                        Obx(() => controller
                            .tabs[controller.selectedIndex.value]['screen']),
                      ]))),
        ));
  }
}
