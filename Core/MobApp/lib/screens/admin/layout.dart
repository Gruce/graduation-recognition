import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'appbar.dart';
import 'nav_bar/navbar.dart';
import 'sidebar/sidebar_screen.dart';

class AdminLayoutScreen extends GetView<AdminLayoutController> {
  const AdminLayoutScreen({Key? key, required this.title, required this.child})
      : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        drawer: AdminSidebarScreen(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.13),
            child: SafeArea(child: AdminAppbar(
              title: title,
            ))),
        bottomNavigationBar: AdminBottomNavigationBar(),
        // body: child
        body: child
        );
  }
}
