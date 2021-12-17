import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/student/student_layout_controller.dart';
import 'appbar.dart';
import 'nav_bar/navbar.dart';
import 'sidebar/sidebar_screen.dart';

class StudentLayoutScreen extends GetView<StudentLayoutController> {
  const StudentLayoutScreen({Key? key, required this.title, required this.child})
      : super(key: key);
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        drawer: StudentSidebarScreen(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
            child: SafeArea(child: StudentAppbar(
              title: title,
            ))),
        bottomNavigationBar: StudentBottomNavigationBar(),
        // body: child
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: child,
              )
            ],
          ),
        ));
  }
}
