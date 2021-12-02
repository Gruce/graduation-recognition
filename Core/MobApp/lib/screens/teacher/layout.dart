import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'home_page/appbar.dart';
import 'nav_bar/navbar.dart';
import 'sidebar/sidebar_screen.dart';

class TeachLayoutScreen extends GetView<TeacherLayoutController> {
  const TeachLayoutScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: TeacherSidebarScreen(),
      bottomNavigationBar: TeacherBottomNavigationBar(),
      // body: child
      body: SafeArea(child: ListView(
        children: [
          const AdminAppbar(),
           Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: child,
           )
        ],
      ),)
    );
  }
}
