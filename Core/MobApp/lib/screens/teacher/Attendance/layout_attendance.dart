import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/screens/teacher/appbar.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';


class AttendancLayoutScreen extends GetView<TeacherLayoutController> {
  const AttendancLayoutScreen({Key? key, required this.title, required this.child})
      : super(key: key);
  final Widget child;
  final String title;
  @override
   Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        
        appBar: _appBar(context),
       
        // body: child
        body: child
        );
  }
   _appBar(BuildContext) {
    return AppBar(
      title: Text(
        'Attendance',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Color(0xFAFAFA),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
        onTap: () {
          Get.to(TeacherHomeScreen());
        },
      ),
    );
  }
}
