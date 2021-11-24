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
        body: Column(children: [
          const AdminAppbar(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: GetX<AdminLayoutController>(
              init: AdminLayoutController(),
              builder: (controller) => controller.widgetOptions
                  .elementAt(controller.selectedIndex.value),
            ),
          ),
        ]));
  }
}
