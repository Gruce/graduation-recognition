// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/Student/student_layout_controller.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_layout_controller.dart';
import 'package:graduaiton_app/screens/student/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/teacher/appbar.dart';
import 'package:graduaiton_app/screens/teacher/home_page/home_screen.dart';


class ChangeStageLayoutScreen extends GetView<StudentLayoutController> {
  const ChangeStageLayoutScreen({Key? key, required this.title, required this.child})
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
   // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
   _appBar(BuildContext) {
    return AppBar(
      title: Text(
        'Change The Stage',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      // ignore: use_full_hex_values_for_flutter_colors
      backgroundColor: Color(0xFAFAFA),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
        onTap: () {
          Get.to(StudentHomeScreen());
        },
      ),
    );
  }
}
