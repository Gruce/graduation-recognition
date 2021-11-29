import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Admin/admin_layout_controller.dart';
import 'home_page/appbar.dart';
import 'nav_bar/navbar.dart';
import 'sidebar/sidebar_screen.dart';

class AdminLayoutScreen extends GetView<AdminLayoutController> {
  const AdminLayoutScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        drawer: AdminSidebarScreen(),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100), child: AdminAppbar()),
        bottomNavigationBar: AdminBottomNavigationBar(),
        // body: child
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                margin:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: child,
              )
            ],
          ),
        ));
  }
}
